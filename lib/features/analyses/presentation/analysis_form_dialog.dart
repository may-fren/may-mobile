import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:may_mobile/core/constants/app_colors.dart';
import 'package:may_mobile/core/network/api_exceptions.dart';
import 'package:may_mobile/features/analyses/domain/analysis_model.dart';
import 'package:may_mobile/features/modules/presentation/modules_provider.dart';
import 'package:may_mobile/shared/widgets/modern_sheet.dart';

class AnalysisFormDialog extends ConsumerStatefulWidget {
  final Analysis? analysis;
  final Future<void> Function(Object request) onSave;

  const AnalysisFormDialog({super.key, this.analysis, required this.onSave});

  @override
  ConsumerState<AnalysisFormDialog> createState() => _AnalysisFormDialogState();
}

class _AnalysisFormDialogState extends ConsumerState<AnalysisFormDialog> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _name;
  late final TextEditingController _description;
  late final TextEditingController _note;
  int? _selectedModuleId;
  String _status = 'ACTIVE';
  bool _saving = false;

  bool get isEditing => widget.analysis != null;

  @override
  void initState() {
    super.initState();
    _name = TextEditingController(text: widget.analysis?.name);
    _description = TextEditingController(text: widget.analysis?.description);
    _note = TextEditingController(text: widget.analysis?.note);
    if (widget.analysis != null) {
      _selectedModuleId = widget.analysis!.moduleId;
      _status = widget.analysis!.status;
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
        await widget.onSave(UpdateAnalysisRequest(
          name: _name.text.trim(),
          description: _description.text.trim().isEmpty ? null : _description.text.trim(),
          moduleId: _selectedModuleId!,
          note: _note.text.trim().isEmpty ? null : _note.text.trim(),
          status: _status,
        ));
      } else {
        await widget.onSave(CreateAnalysisRequest(
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
            content: Text(isEditing ? 'Analiz güncellendi' : 'Analiz oluşturuldu'),
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
      title: isEditing ? 'Analiz Düzenle' : 'Yeni Analiz',
      icon: isEditing ? Icons.edit_outlined : Icons.analytics_outlined,
      formKey: _formKey,
      saving: _saving,
      onSave: _handleSave,
      buttonLabel: isEditing ? 'Güncelle' : 'Oluştur',
      fields: [
        TextFormField(
          controller: _name,
          decoration: modernInputDecoration(label: 'Analiz Adı', prefixIcon: Icons.label_outline),
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
