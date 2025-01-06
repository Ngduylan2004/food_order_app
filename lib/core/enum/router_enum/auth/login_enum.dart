enum LoginEnum {
  login(path: '/login', name: 'login'),
  passwordRecovery(path: '/login/password-recovery', name: 'password-recovery'),
  checkEmail(path: '/login/check-email', name: 'check-email'),
  resetPassword(path: '/login/reset-password', name: 'reset-password');

  final String path;
  final String name;

  const LoginEnum({required this.path, required this.name});
}
