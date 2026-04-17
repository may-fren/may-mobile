import 'package:flutter/material.dart';
import 'package:may_mobile/core/constants/app_colors.dart';
import 'package:may_mobile/core/network/api_exceptions.dart';
import 'package:may_mobile/features/permissions/domain/permission_model.dart';
import 'package:may_mobile/shared/widgets/modern_sheet.dart';

class PermissionFormDialog extends StatefulWidget {
  final Permission? permission;
  final Future<void> Function(Object request) onSave;

  const PermissionFormDialog({super.key, this.permission, required this.onSave});

  @override
  State<PermissionFormDialog> createState() => _PermissionFormDialogState();
}

class _PermissionFormDialogState extends State<PermissionFormDialog> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _name;
  late final TextEditingController _description;
  late final TextEditingController _module;
  late final TextEditingController _action;
  String _status = 'ACTIVE';
  bool _saving = false;

  bool get isEditing => widget.permission != null;

  @override
  void initState() {
    super.initState();
    _name = TextEditingController(text: widget.permission?.name);
    _description = TextEditingController(text: widget.permission?.description);
    _module = TextEditingController(text: widget.permission?.module);
    _action = TextEditingController(text: widget.permission?.action);
    if (widget.permission != null) _status = widget.permission!.status;
  }

  @override
  void dispose() {
    _name.dispose();
    _description.dispose();
    _module.dispose();
    _action.dispose();
    super.dispose();
  }

  Future<void> _handleSave() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() => _saving = true);
    try {
      if (isEditing) {
        await widget.onSave(UpdatePermissionRequest(
          name: _name.text.trim(),
          description: _description.text.trim().isEmpty ? null : _description.text.trim(),
          module: _module.text.trim().isEmpty ? null : _module.text.trim(),
          action: _action.text.trim().isEmpty ? null : _action.text.trim(),
          status: _status,
        ));
      } else {
        await widget.onSave(CreatePermissionRequest(
          name: _name.text.trim(),
          description: _description.text.trim().isEmpty ? null : _description.text.trim(),
          module: _module.text.trim().isEmpty ? null : _module.text.trim(),
          action: _action.text.trim().isEmpty ? null : _action.text.trim(),
        ));
      }
      if (mounted) {
        Navigator.of(context).pop();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(isEditing ? 'Yetki güncellendi' : 'Yetki oluşturuldu'),
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
      title: isEditing ? 'Yetki Düzenle' : 'Yeni Yetki',
      icon: isEditing ? Icons.edit_outlined : Icons.security_outlined,
      formKey: _formKey,
      saving: _saving,
      onSave: _handleSave,
      buttonLabel: isEditing ? 'Güncelle' : 'Oluştur',
      fields: [
        TextFormField(
          controller: _name,
          decoration: modernInputDecoration(label: 'Yetki Adı', prefixIcon: Icons.key_outlined),
          validator: (v) => (v == null || v.trim().isEmpty) ? 'Zorunlu alan' : null,
        ),
        const SizedBox(height: 14),
        TextFormField(
          controller: _description,
          decoration: modernInputDecoration(label: 'Açıklama', prefixIcon: Icons.description_outlined),
        ),
        const SizedBox(height: 14),
        Row(
          children: [
            Expanded(
              child: TextFormField(
                controller: _module,
                decoration: modernInputDecoration(label: 'Modül'),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: TextFormField(
                controller: _action,
                decoration: modernInputDecoration(label: 'Aksiyon'),
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
