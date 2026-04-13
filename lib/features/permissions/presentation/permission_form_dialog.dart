import 'package:flutter/material.dart';
import 'package:may_mobile/core/constants/app_colors.dart';
import 'package:may_mobile/core/network/api_exceptions.dart';
import 'package:may_mobile/features/permissions/domain/permission_model.dart';

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
            content: Text(isEditing ? 'Yetki guncellendi' : 'Yetki olusturuldu'),
            backgroundColor: AppColors.success,
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(e is ApiException ? e.message : 'Islem basarisiz'),
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
    return Padding(
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Container(
        padding: const EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      isEditing ? 'Yetki Duzenle' : 'Yeni Yetki',
                      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                    ),
                    IconButton(
                      onPressed: () => Navigator.of(context).pop(),
                      icon: const Icon(Icons.close),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _name,
                  decoration: const InputDecoration(labelText: 'Yetki Adi'),
                  validator: (v) => (v == null || v.trim().isEmpty) ? 'Zorunlu alan' : null,
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: _description,
                  decoration: const InputDecoration(labelText: 'Aciklama'),
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: _module,
                  decoration: const InputDecoration(labelText: 'Modul'),
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: _action,
                  decoration: const InputDecoration(labelText: 'Aksiyon'),
                ),
                if (isEditing) ...[
                  const SizedBox(height: 12),
                  DropdownButtonFormField<String>(
                    value: _status,
                    decoration: const InputDecoration(labelText: 'Durum'),
                    items: const [
                      DropdownMenuItem(value: 'ACTIVE', child: Text('ACTIVE')),
                      DropdownMenuItem(value: 'INACTIVE', child: Text('INACTIVE')),
                    ],
                    onChanged: (v) => setState(() => _status = v!),
                  ),
                ],
                const SizedBox(height: 24),
                FilledButton(
                  onPressed: _saving ? null : _handleSave,
                  style: FilledButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    minimumSize: const Size(double.infinity, 48),
                  ),
                  child: _saving
                      ? const SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2),
                        )
                      : Text(isEditing ? 'Guncelle' : 'Olustur'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
