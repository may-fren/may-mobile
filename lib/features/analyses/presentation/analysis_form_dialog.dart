import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:may_mobile/core/constants/app_colors.dart';
import 'package:may_mobile/core/network/api_exceptions.dart';
import 'package:may_mobile/features/analyses/domain/analysis_model.dart';
import 'package:may_mobile/features/modules/domain/module_model.dart';
import 'package:may_mobile/features/modules/presentation/modules_provider.dart';

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
            content: Text(isEditing ? 'Analiz guncellendi' : 'Analiz olusturuldu'),
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
                      isEditing ? 'Analiz Duzenle' : 'Yeni Analiz',
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
                  decoration: const InputDecoration(labelText: 'Analiz Adi'),
                  validator: (v) => (v == null || v.trim().isEmpty) ? 'Zorunlu alan' : null,
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: _description,
                  decoration: const InputDecoration(labelText: 'Aciklama'),
                  maxLines: 2,
                ),
                const SizedBox(height: 12),
                modulesAsync.when(
                  data: (modules) => DropdownButtonFormField<int>(
                    value: _selectedModuleId,
                    decoration: const InputDecoration(labelText: 'Modul'),
                    items: modules.map((m) => DropdownMenuItem(value: m.id, child: Text(m.name))).toList(),
                    onChanged: (v) => setState(() => _selectedModuleId = v),
                    validator: (v) => v == null ? 'Zorunlu alan' : null,
                  ),
                  loading: () => const LinearProgressIndicator(),
                  error: (_, __) => const Text('Moduller yuklenemedi'),
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: _note,
                  decoration: const InputDecoration(labelText: 'Not'),
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
