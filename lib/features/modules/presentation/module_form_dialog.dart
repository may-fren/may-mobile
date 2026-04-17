import 'package:flutter/material.dart';
import 'package:may_mobile/core/constants/app_colors.dart';
import 'package:may_mobile/core/network/api_exceptions.dart';
import 'package:may_mobile/features/modules/domain/module_model.dart';
import 'package:may_mobile/shared/widgets/modern_sheet.dart';

class ModuleFormDialog extends StatefulWidget {
  final Module? module;
  final Future<void> Function(Object request) onSave;

  const ModuleFormDialog({super.key, this.module, required this.onSave});

  @override
  State<ModuleFormDialog> createState() => _ModuleFormDialogState();
}

class _ModuleFormDialogState extends State<ModuleFormDialog> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _name;
  late final TextEditingController _brand;
  late final TextEditingController _model;
  late final TextEditingController _year;
  late final TextEditingController _code;
  String _status = 'ACTIVE';
  bool _saving = false;

  bool get isEditing => widget.module != null;

  @override
  void initState() {
    super.initState();
    _name = TextEditingController(text: widget.module?.name);
    _brand = TextEditingController(text: widget.module?.brand);
    _model = TextEditingController(text: widget.module?.model);
    _year = TextEditingController(text: widget.module?.year?.toString());
    _code = TextEditingController(text: widget.module?.code);
    if (widget.module != null) _status = widget.module!.status;
  }

  @override
  void dispose() {
    _name.dispose();
    _brand.dispose();
    _model.dispose();
    _year.dispose();
    _code.dispose();
    super.dispose();
  }

  Future<void> _handleSave() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() => _saving = true);
    try {
      final yearValue = _year.text.trim().isEmpty ? null : int.tryParse(_year.text.trim());
      if (isEditing) {
        await widget.onSave(UpdateModuleRequest(
          name: _name.text.trim(),
          brand: _brand.text.trim(),
          model: _model.text.trim(),
          year: yearValue,
          code: _code.text.trim(),
          status: _status,
        ));
      } else {
        await widget.onSave(CreateModuleRequest(
          name: _name.text.trim(),
          brand: _brand.text.trim(),
          model: _model.text.trim(),
          year: yearValue,
          code: _code.text.trim(),
        ));
      }
      if (mounted) {
        Navigator.of(context).pop();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(isEditing ? 'Modül güncellendi' : 'Modül oluşturuldu'),
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
      title: isEditing ? 'Modül Düzenle' : 'Yeni Modül',
      icon: isEditing ? Icons.edit_outlined : Icons.precision_manufacturing_outlined,
      formKey: _formKey,
      saving: _saving,
      onSave: _handleSave,
      buttonLabel: isEditing ? 'Güncelle' : 'Oluştur',
      fields: [
        TextFormField(
          controller: _name,
          decoration: modernInputDecoration(label: 'Modül Adı', prefixIcon: Icons.label_outline),
          validator: (v) => (v == null || v.trim().isEmpty) ? 'Zorunlu alan' : null,
        ),
        const SizedBox(height: 14),
        Row(
          children: [
            Expanded(
              child: TextFormField(
                controller: _brand,
                decoration: modernInputDecoration(label: 'Marka'),
                validator: (v) => (v == null || v.trim().isEmpty) ? 'Zorunlu alan' : null,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: TextFormField(
                controller: _model,
                decoration: modernInputDecoration(label: 'Model'),
                validator: (v) => (v == null || v.trim().isEmpty) ? 'Zorunlu alan' : null,
              ),
            ),
          ],
        ),
        const SizedBox(height: 14),
        Row(
          children: [
            Expanded(
              child: TextFormField(
                controller: _year,
                decoration: modernInputDecoration(label: 'Yıl', prefixIcon: Icons.calendar_today_outlined),
                keyboardType: TextInputType.number,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: TextFormField(
                controller: _code,
                decoration: modernInputDecoration(label: 'Kod', prefixIcon: Icons.qr_code_outlined),
                validator: (v) => (v == null || v.trim().isEmpty) ? 'Zorunlu alan' : null,
              ),
            ),
          ],
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
