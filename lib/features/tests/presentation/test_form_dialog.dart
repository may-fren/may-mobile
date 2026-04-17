import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:may_mobile/core/constants/app_colors.dart';
import 'package:may_mobile/core/network/api_exceptions.dart';
import 'package:may_mobile/features/tests/domain/test_model.dart';
import 'package:may_mobile/features/modules/presentation/modules_provider.dart';
import 'package:may_mobile/shared/widgets/modern_sheet.dart';

class TestFormDialog extends ConsumerStatefulWidget {
  final TestItem? test;
  final Future<void> Function(Object request) onSave;

  const TestFormDialog({super.key, this.test, required this.onSave});

  @override
  ConsumerState<TestFormDialog> createState() => _TestFormDialogState();
}

class _TestFormDialogState extends ConsumerState<TestFormDialog> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _name;
  late final TextEditingController _description;
  late final TextEditingController _note;
  int? _selectedModuleId;
  String _status = 'ACTIVE';
  bool _saving = false;

  bool get isEditing => widget.test != null;

  @override
  void initState() {
    super.initState();
    _name = TextEditingController(text: widget.test?.name);
    _description = TextEditingController(text: widget.test?.description);
    _note = TextEditingController(text: widget.test?.note);
    if (widget.test != null) {
      _selectedModuleId = widget.test!.moduleId;
      _status = widget.test!.status;
    }
  }

  @override
  void dispose() {
    _name.dispose();
    _description.dispose();
    _note.dispose();
    super.dispose();
  }

  Future<void> _handleSave() async {
    if (!_formKey.currentState!.validate()) return;
    if (_selectedModuleId == null) return;
    setState(() => _saving = true);
    try {
      if (isEditing) {
        await widget.onSave(UpdateTestRequest(
          name: _name.text.trim(),
          description: _description.text.trim().isEmpty ? null : _description.text.trim(),
          moduleId: _selectedModuleId!,
          note: _note.text.trim().isEmpty ? null : _note.text.trim(),
          status: _status,
        ));
      } else {
        await widget.onSave(CreateTestRequest(
          name: _name.text.trim(),
          description: _description.text.trim().isEmpty ? null : _description.text.trim(),
          moduleId: _selectedModuleId!,
          note: _note.text.trim().isEmpty ? null : _note.text.trim(),
        ));
      }
      if (mounted) {
        Navigator.of(context).pop();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(isEditing ? 'Test güncellendi' : 'Test oluşturuldu'),
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
    final modulesAsync = ref.watch(allModulesProvider);

    return ModernFormSheet(
      title: isEditing ? 'Test Düzenle' : 'Yeni Test',
      icon: isEditing ? Icons.edit_outlined : Icons.science_outlined,
      formKey: _formKey,
      saving: _saving,
      onSave: _handleSave,
      buttonLabel: isEditing ? 'Güncelle' : 'Oluştur',
      fields: [
        TextFormField(
          controller: _name,
          decoration: modernInputDecoration(label: 'Test Adı', prefixIcon: Icons.label_outline),
          validator: (v) => (v == null || v.trim().isEmpty) ? 'Zorunlu alan' : null,
        ),
        const SizedBox(height: 14),
        TextFormField(
          controller: _description,
          decoration: modernInputDecoration(label: 'Açıklama', prefixIcon: Icons.description_outlined),
          maxLines: 2,
        ),
        const SizedBox(height: 14),
        modulesAsync.when(
          data: (modules) => DropdownButtonFormField<int>(
            value: _selectedModuleId,
            decoration: modernInputDecoration(label: 'Modül', prefixIcon: Icons.precision_manufacturing_outlined),
            items: modules.map((m) => DropdownMenuItem(value: m.id, child: Text(m.name))).toList(),
            onChanged: (v) => setState(() => _selectedModuleId = v),
            validator: (v) => v == null ? 'Zorunlu alan' : null,
          ),
          loading: () => const LinearProgressIndicator(),
          error: (_, __) => const Text('Modüller yüklenemedi'),
        ),
        const SizedBox(height: 14),
        TextFormField(
          controller: _note,
          decoration: modernInputDecoration(label: 'Not', prefixIcon: Icons.note_outlined),
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
