enum ProfileEnum {
  profile(path: '/dashboard/profile', name: 'profile');

  final String path;
  final String name;

  const ProfileEnum({required this.path, required this.name});
}
