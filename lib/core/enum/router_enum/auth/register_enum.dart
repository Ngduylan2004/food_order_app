enum RegisterEnum {
  register(path: '/register', name: 'register'),
  registerStep(path: '/register/step', name: 'register-step');

  final String path;
  final String name;

  const RegisterEnum({required this.path, required this.name});
}
