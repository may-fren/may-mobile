import 'package:flutter/material.dart';
import 'package:may_mobile/core/constants/app_colors.dart';
import 'package:may_mobile/core/network/api_exceptions.dart';
import 'package:may_mobile/features/roles/domain/role_model.dart';
import 'package:may_mobile/shared/widgets/modern_sheet.dart';

class RoleFormDialog extends StatefulWidget {
  final Role? role;
  final Future<void> Function(Object request) onSave;

  const RoleFormDialog({super.key, this.role, required this.onSave});

  @override
  State<RoleFormDialog> createState() => _RoleFormDialogState();
}

class _RoleFormDialogState extends State<RoleFormDialog> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _name;
  late final TextEditingController _description;
  String _status = 'ACTIVE';
  bool _saving = false;

  bool get isEditing => widget.role != null;

  @override
  void initState() {
    super.initState();
    _name = TextEditingController(text: widget.role?.name);
    _description = TextEditingController(text: widget.role?.description);
    if (widget.role != null) _status = widget.role!.status;
  }

  @override
  void dispose() {
    _name.dispose();
    _description.dispose();
    super.dispose();
  }

  Future<void> _handleSave() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() => _saving = true);
    try {
      if (isEditing) {
        await widget.onSave(UpdateRoleRequest(
          name: _name.text.trim(),
          description: _description.text.trim().isEmpty ? null : _description.text.trim(),
          status: _status,
        ));
      } else {
        await widget.onSave(CreateRoleRequest(
          name: _name.text.trim(),
          description: _description.text.trim().isEmpty ? null : _description.text.trim(),
        ));
      }
      if (mounted) {
        Navigator.of(context).pop();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(isEditing ? 'Rol güncellendi' : 'Rol oluşturuldu'),
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
      title: isEditing ? 'Rol Düzenle' : 'Yeni Rol',
      icon: isEditing ? Icons.edit_outlined : Icons.shield_outlined,
      formKey: _formKey,
      saving: _saving,
      onSave: _handleSave,
      buttonLabel: isEditing ? 'Güncelle' : 'Oluştur',
      fields: [
        TextFormField(
          controller: _name,
          decoration: modernInputDecoration(label: 'Rol Adı', prefixIcon: Icons.badge_outlined),
          validator: (v) => (v == null || v.trim().isEmpty) ? 'Zorunlu alan' : null,
        ),
        const SizedBox(height: 14),
        TextFormField(
          controller: _description,
          decoration: modernInputDecoration(label: 'Açıklama', prefixIcon: Icons.description_outlined),
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
