import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:may_mobile/core/constants/app_colors.dart';
import 'package:may_mobile/core/network/api_exceptions.dart';
import 'package:may_mobile/core/network/session_limit_exception.dart';
import 'package:may_mobile/features/auth/presentation/auth_provider.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _username = TextEditingController();
  final _password = TextEditingController();
  bool _obscure = true;
  bool _loading = false;

  @override
  void dispose() {
    _username.dispose();
    _password.dispose();
    super.dispose();
  }

  Future<void> _handleLogin({bool forceLogin = false}) async {
    if (!_formKey.currentState!.validate()) return;
    setState(() => _loading = true);
    try {
      await ref
          .read(authProvider.notifier)
          .login(_username.text.trim(), _password.text, forceLogin: forceLogin);
    } on SessionLimitException catch (e) {
      if (mounted) {
        _showSessionLimitDialog(e);
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content:
                Text(e is ApiException ? e.message : 'Giriş başarısız'),
            backgroundColor: AppColors.error,
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            margin: const EdgeInsets.all(16),
          ),
        );
      }
    } finally {
      if (mounted) setState(() => _loading = false);
    }
  }

  void _showSessionLimitDialog(SessionLimitException e) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Aktif Oturum Limiti'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Bu platformda zaten aktif bir oturumunuz var. Devam ederseniz mevcut oturum sonlandırılacaktır.',
            ),
            const SizedBox(height: 16),
            ...e.activeSessions.map((session) => Card(
              margin: const EdgeInsets.only(bottom: 8),
              child: ListTile(
                dense: true,
                leading: Icon(
                  session.platform == 'WEB' ? Icons.computer : Icons.phone_android,
                  color: session.platform == 'WEB' ? Colors.blue : Colors.green,
                ),
                title: Text(session.platform, style: const TextStyle(fontWeight: FontWeight.bold)),
                subtitle: Text('IP: ${session.ipAddress}'),
              ),
            )),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Vazgeç'),
          ),
          FilledButton(
            onPressed: () {
              Navigator.pop(ctx);
              _handleLogin(forceLogin: true);
            },
            style: FilledButton.styleFrom(backgroundColor: AppColors.error),
            child: const Text('Oturumu Kapat ve Giriş Yap'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final bottomInset = MediaQuery.of(context).viewInsets.bottom;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: LayoutBuilder(
            builder: (context, constraints) {
              return SingleChildScrollView(
                padding: EdgeInsets.only(
                  left: 28,
                  right: 28,
                  top: constraints.maxHeight * 0.08,
                  bottom: bottomInset > 0 ? 20 : 40,
                ),
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: constraints.maxHeight -
                        (constraints.maxHeight * 0.08) -
                        (bottomInset > 0 ? 20 : 40),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Logo & Branding
                      _buildHeader(bottomInset > 0),
                      SizedBox(height: bottomInset > 0 ? 28 : 48),
                      // Login Form
                      _buildForm(),
                      const SizedBox(height: 32),
                      // Login Button
                      _buildLoginButton(),
                      const SizedBox(height: 24),
                      // Footer
                      if (bottomInset == 0) _buildFooter(),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(bool compact) {
    return AnimatedSize(
      duration: const Duration(milliseconds: 200),
      child: Column(
        children: [
          Image.asset(
            'assets/images/may_logo.png',
            height: compact ? 60 : 100,
            fit: BoxFit.contain,
          ),
        ],
      ),
    );
  }

  Widget _buildForm() {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          // Username
          TextFormField(
            controller: _username,
            textInputAction: TextInputAction.next,
            autocorrect: false,
            style: const TextStyle(fontSize: 16),
            decoration: InputDecoration(
              labelText: 'Kullanıcı Adı',
              hintText: 'Kullanıcı adınızı girin',
              prefixIcon: const Icon(Icons.person_outline, size: 22),
              filled: true,
              fillColor: AppColors.surface,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 18,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
                borderSide: BorderSide(color: AppColors.border),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
                borderSide: BorderSide(color: AppColors.border),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
                borderSide: const BorderSide(
                  color: AppColors.primary,
                  width: 1.5,
                ),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
                borderSide: const BorderSide(color: AppColors.error),
              ),
            ),
            validator: (v) =>
                (v == null || v.trim().isEmpty) ? 'Kullanıcı adı zorunlu' : null,
          ),
          const SizedBox(height: 16),

          // Password
          TextFormField(
            controller: _password,
            obscureText: _obscure,
            textInputAction: TextInputAction.done,
            onFieldSubmitted: (_) => _handleLogin(),
            style: const TextStyle(fontSize: 16),
            decoration: InputDecoration(
              labelText: 'Şifre',
              hintText: 'Şifrenizi girin',
              prefixIcon: const Icon(Icons.lock_outline, size: 22),
              suffixIcon: GestureDetector(
                onTap: () => setState(() => _obscure = !_obscure),
                child: Padding(
                  padding: const EdgeInsets.only(right: 4),
                  child: Icon(
                    _obscure
                        ? Icons.visibility_off_outlined
                        : Icons.visibility_outlined,
                    color: AppColors.textSecondary,
                    size: 22,
                  ),
                ),
              ),
              filled: true,
              fillColor: AppColors.surface,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 18,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
                borderSide: BorderSide(color: AppColors.border),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
                borderSide: BorderSide(color: AppColors.border),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
                borderSide: const BorderSide(
                  color: AppColors.primary,
                  width: 1.5,
                ),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
                borderSide: const BorderSide(color: AppColors.error),
              ),
            ),
            validator: (v) =>
                (v == null || v.isEmpty) ? 'Şifre zorunlu' : null,
          ),
        ],
      ),
    );
  }

  Widget _buildLoginButton() {
    return SizedBox(
      width: double.infinity,
      height: 54,
      child: FilledButton(
        onPressed: _loading ? null : _handleLogin,
        style: FilledButton.styleFrom(
          backgroundColor: AppColors.primary,
          disabledBackgroundColor: AppColors.primary.withValues(alpha: 0.6),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
          elevation: 0,
        ),
        child: _loading
            ? const SizedBox(
                width: 24,
                height: 24,
                child: CircularProgressIndicator(
                  color: Colors.white,
                  strokeWidth: 2.5,
                ),
              )
            : const Text(
                'Giriş Yap',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.3,
                ),
              ),
      ),
    );
  }

  Widget _buildFooter() {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: Text(
        'MAY v1.0',
        style: TextStyle(
          fontSize: 12,
          color: AppColors.textSecondary.withValues(alpha: 0.6),
        ),
      ),
    );
  }
}
