enum DashboardEnum {
  dashboard(path: '/dashboard', name: 'dashboard');

  final String path;
  final String name;

  const DashboardEnum({required this.path, required this.name});
}
