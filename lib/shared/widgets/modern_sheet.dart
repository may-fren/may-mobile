import 'package:flutter/material.dart';
import 'package:may_mobile/core/constants/app_colors.dart';

class ModernSheet extends StatelessWidget {
  final String title;
  final IconData icon;
  final Widget child;
  final Widget? action;

  const ModernSheet({
    super.key,
    required this.title,
    required this.icon,
    required this.child,
    this.action,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Drag handle
            Container(
              margin: const EdgeInsets.only(top: 12),
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: AppColors.border,
                borderRadius: BorderRadius.circular(2),
              ),
            ),

            // Header
            Container(
              margin: const EdgeInsets.fromLTRB(24, 20, 16, 0),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: AppColors.primary.withValues(alpha: 0.08),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(icon, color: AppColors.primary, size: 22),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Text(
                      title,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: AppColors.textPrimary,
                        letterSpacing: -0.3,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  if (action != null) action!,
                  IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: AppColors.background,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Icon(Icons.close, size: 18, color: AppColors.textSecondary),
                    ),
                  ),
                ],
              ),
            ),

            // Divider
            Container(
              margin: const EdgeInsets.only(top: 16),
              height: 1,
              color: AppColors.border,
            ),

            // Content
            Flexible(child: child),
          ],
        ),
      ),
    );
  }
}

class ModernFormSheet extends StatelessWidget {
  final String title;
  final IconData icon;
  final GlobalKey<FormState> formKey;
  final List<Widget> fields;
  final String buttonLabel;
  final bool saving;
  final VoidCallback? onSave;

  const ModernFormSheet({
    super.key,
    required this.title,
    required this.icon,
    required this.formKey,
    required this.fields,
    required this.buttonLabel,
    required this.saving,
    required this.onSave,
  });

  @override
  Widget build(BuildContext context) {
    return ModernSheet(
      title: title,
      icon: icon,
      child: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(24, 20, 24, 24),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ...fields,
              const SizedBox(height: 28),
              FilledButton(
                onPressed: saving ? null : onSave,
                style: FilledButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  disabledBackgroundColor: AppColors.primary.withValues(alpha: 0.6),
                  minimumSize: const Size(double.infinity, 52),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                  elevation: 0,
                ),
                child: saving
                    ? const SizedBox(
                        width: 22,
                        height: 22,
                        child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2.5),
                      )
                    : Text(
                        buttonLabel,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 0.3,
                        ),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

InputDecoration modernInputDecoration({
  required String label,
  IconData? prefixIcon,
}) {
  return InputDecoration(
    labelText: label,
    labelStyle: const TextStyle(
      color: AppColors.textSecondary,
      fontSize: 14,
      fontWeight: FontWeight.w500,
    ),
    prefixIcon: prefixIcon != null
        ? Icon(prefixIcon, size: 20, color: AppColors.textSecondary)
        : null,
    filled: true,
    fillColor: AppColors.background,
    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide.none,
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide.none,
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: AppColors.primary, width: 1.5),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: AppColors.error),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: AppColors.error, width: 1.5),
    ),
  );
}
