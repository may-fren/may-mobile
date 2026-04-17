import 'package:flutter/material.dart';
import 'package:may_mobile/core/constants/app_colors.dart';
import 'package:may_mobile/core/network/api_exceptions.dart';
import 'package:may_mobile/features/users/domain/user_model.dart';
import 'package:may_mobile/shared/widgets/modern_sheet.dart';

class UserFormDialog extends StatefulWidget {
  final User? user;
  final Future<void> Function(Object request) onSave;

  const UserFormDialog({super.key, this.user, required this.onSave});

  @override
  State<UserFormDialog> createState() => _UserFormDialogState();
}

class _UserFormDialogState extends State<UserFormDialog> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _username;
  late final TextEditingController _email;
  late final TextEditingController _password;
  late final TextEditingController _firstName;
  late final TextEditingController _lastName;
  late final TextEditingController _phone;
  String _status = 'ACTIVE';
  bool _saving = false;

  bool get isEditing => widget.user != null;

  @override
  void initState() {
    super.initState();
    _username = TextEditingController(text: widget.user?.username);
    _email = TextEditingController(text: widget.user?.email);
    _password = TextEditingController();
    _firstName = TextEditingController(text: widget.user?.firstName);
    _lastName = TextEditingController(text: widget.user?.lastName);
    _phone = TextEditingController(text: widget.user?.phone);
    if (widget.user != null) _status = widget.user!.status;
  }

  @override
  void dispose() {
    _username.dispose();
    _email.dispose();
    _password.dispose();
    _firstName.dispose();
    _lastName.dispose();
    _phone.dispose();
    super.dispose();
  }

  Future<void> _handleSave() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() => _saving = true);
    try {
      if (isEditing) {
        await widget.onSave(UpdateUserRequest(
          email: _email.text.trim(),
          firstName: _firstName.text.trim(),
          lastName: _lastName.text.trim(),
          phone: _phone.text.trim(),
          status: _status,
        ));
      } else {
        await widget.onSave(CreateUserRequest(
          username: _username.text.trim(),
          email: _email.text.trim(),
          password: _password.text,
          firstName: _firstName.text.trim(),
          lastName: _lastName.text.trim(),
          phone: _phone.text.trim(),
        ));
      }
      if (mounted) {
        Navigator.of(context).pop();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(isEditing ? 'Kullanıcı güncellendi' : 'Kullanıcı oluşturuldu'),
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
      title: isEditing ? 'Kullanıcı Düzenle' : 'Yeni Kullanıcı',
      icon: isEditing ? Icons.edit_outlined : Icons.person_add_outlined,
      formKey: _formKey,
      saving: _saving,
      onSave: _handleSave,
      buttonLabel: isEditing ? 'Güncelle' : 'Oluştur',
      fields: [
        if (!isEditing) ...[
          TextFormField(
            controller: _username,
            decoration: modernInputDecoration(label: 'Kullanıcı Adı', prefixIcon: Icons.person_outline),
            validator: (v) => (v == null || v.trim().isEmpty) ? 'Zorunlu alan' : null,
          ),
          const SizedBox(height: 14),
        ],
        Row(
          children: [
            Expanded(
              child: TextFormField(
                controller: _firstName,
                decoration: modernInputDecoration(label: 'Ad'),
                validator: (v) => (v == null || v.trim().isEmpty) ? 'Zorunlu alan' : null,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: TextFormField(
                controller: _lastName,
                decoration: modernInputDecoration(label: 'Soyad'),
                validator: (v) => (v == null || v.trim().isEmpty) ? 'Zorunlu alan' : null,
              ),
            ),
          ],
        ),
        const SizedBox(height: 14),
        TextFormField(
          controller: _email,
          decoration: modernInputDecoration(label: 'E-posta', prefixIcon: Icons.email_outlined),
          keyboardType: TextInputType.emailAddress,
          validator: (v) {
            if (v == null || v.trim().isEmpty) return 'Zorunlu alan';
            if (!v.contains('@')) return 'Geçerli e-posta girin';
            return null;
          },
        ),
        const SizedBox(height: 14),
        TextFormField(
          controller: _phone,
          decoration: modernInputDecoration(label: 'Telefon', prefixIcon: Icons.phone_outlined),
          keyboardType: TextInputType.phone,
          validator: (v) => (v == null || v.trim().isEmpty) ? 'Zorunlu alan' : null,
        ),
        if (!isEditing) ...[
          const SizedBox(height: 14),
          TextFormField(
            controller: _password,
            decoration: modernInputDecoration(label: 'Şifre', prefixIcon: Icons.lock_outline),
            obscureText: true,
            validator: (v) {
              if (v == null || v.isEmpty) return 'Zorunlu alan';
              if (v.length < 8) return 'En az 8 karakter';
              return null;
            },
          ),
        ],
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
