import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:may_mobile/core/constants/app_colors.dart';
import 'package:may_mobile/core/network/api_exceptions.dart';
import 'package:may_mobile/features/services/domain/service_model.dart';
import 'package:may_mobile/shared/widgets/modern_sheet.dart';

class ServiceFormDialog extends ConsumerStatefulWidget {
  final ServiceItem? service;
  final Future<void> Function(Object request) onSave;

  const ServiceFormDialog({super.key, this.service, required this.onSave});

  @override
  ConsumerState<ServiceFormDialog> createState() => _ServiceFormDialogState();
}

class _ServiceFormDialogState extends ConsumerState<ServiceFormDialog> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _name;
  late final TextEditingController _city;
  late final TextEditingController _town;
  late final TextEditingController _address;
  String _status = 'ACTIVE';
  bool _saving = false;

  bool get isEditing => widget.service != null;

  @override
  void initState() {
    super.initState();
    _name = TextEditingController(text: widget.service?.name);
    _city = TextEditingController(text: widget.service?.city);
    _town = TextEditingController(text: widget.service?.town);
    _address = TextEditingController(text: widget.service?.address);
    if (widget.service != null) {
      _status = widget.service!.status;
    }
  }

  @override
  void dispose() {
    _name.dispose();
    _city.dispose();
    _town.dispose();
    _address.dispose();
    super.dispose();
  }

  Future<void> _handleSave() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() => _saving = true);
    try {
      if (isEditing) {
        await widget.onSave(UpdateServiceRequest(
          name: _name.text.trim(),
          city: _city.text.trim().isEmpty ? null : _city.text.trim(),
          town: _town.text.trim().isEmpty ? null : _town.text.trim(),
          address: _address.text.trim().isEmpty ? null : _address.text.trim(),
          status: _status,
        ));
      } else {
        await widget.onSave(CreateServiceRequest(
          name: _name.text.trim(),
          city: _city.text.trim().isEmpty ? null : _city.text.trim(),
          town: _town.text.trim().isEmpty ? null : _town.text.trim(),
          address: _address.text.trim().isEmpty ? null : _address.text.trim(),
        ));
      }
      if (mounted) {
        Navigator.of(context).pop();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(isEditing ? 'Servis güncellendi' : 'Servis oluşturuldu'),
            backgroundColor: AppColors.success,
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(e is ApiException ? e.message : 'İşlem başarısız'),
            backgroundColor: AppColors.error,
          ),
        );
      }
    } finally {
      if (mounted) setState(() => _saving = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ModernFormSheet(
      title: isEditing ? 'Servis Düzenle' : 'Yeni Servis',
      icon: isEditing ? Icons.edit_outlined : Icons.build_outlined,
      formKey: _formKey,
      saving: _saving,
      onSave: _handleSave,
      buttonLabel: isEditing ? 'Güncelle' : 'Oluştur',
      fields: [
        TextFormField(
          controller: _name,
          decoration: modernInputDecoration(label: 'Servis Adı', prefixIcon: Icons.label_outline),
          validator: (v) => (v == null || v.trim().isEmpty) ? 'Zorunlu alan' : null,
        ),
        const SizedBox(height: 14),
        TextFormField(
          controller: _city,
          decoration: modernInputDecoration(label: 'Şehir', prefixIcon: Icons.location_city_outlined),
        ),
        const SizedBox(height: 14),
        TextFormField(
          controller: _town,
          decoration: modernInputDecoration(label: 'İlçe', prefixIcon: Icons.place_outlined),
        ),
        const SizedBox(height: 14),
        TextFormField(
          controller: _address,
          decoration: modernInputDecoration(label: 'Adres', prefixIcon: Icons.home_outlined),
          maxLines: 2,
        ),
        if (isEditing) ...[
          const SizedBox(height: 14),
          DropdownButtonFormField<String>(
            value: _status,
            decoration: modernInputDecoration(label: 'Durum', prefixIcon: Icons.toggle_on_outlined),
            items: const [
              DropdownMenuItem(value: 'ACTIVE', child: Text('Aktif')),
              DropdownMenuItem(value: 'INACTIVE', child: Text('Pasif')),
            ],
            onChanged: (v) => setState(() => _status = v!),
          ),
        ],
      ],
    );
  }
}
