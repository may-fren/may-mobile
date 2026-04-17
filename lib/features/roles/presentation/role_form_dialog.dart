import 'package:flutter/material.dart';
import 'package:may_mobile/core/constants/app_colors.dart';
import 'package:may_mobile/core/network/api_exceptions.dart';
import 'package:may_mobile/features/roles/domain/role_model.dart';

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
            content: Text(isEditing ? 'Rol guncellendi' : 'Rol olusturuldu'),
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
                      isEditing ? 'Rol Duzenle' : 'Yeni Rol',
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
                  decoration: const InputDecoration(labelText: 'Rol Adi'),
                  validator: (v) => (v == null || v.trim().isEmpty) ? 'Zorunlu alan' : null,
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: _description,
                  decoration: const InputDecoration(labelText: 'Aciklama'),
                  maxLines: 2,
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
