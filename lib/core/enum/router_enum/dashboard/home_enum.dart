enum HomeEnum {
  home(path: '/dashboard/home', name: 'home');

  final String path;
  final String name;

  const HomeEnum({required this.path, required this.name});
}
