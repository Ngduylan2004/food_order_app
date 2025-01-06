enum ExploreEnum {
  explore(path: '/dashboard/explore', name: 'explore'),
  category(path: '/dashboard/explore/category', name: 'category'),
  supCategory(
      path: '/dashboard/explore/category/sup-category', name: 'sup-category');

  final String path;
  final String name;

  const ExploreEnum({required this.path, required this.name});
}
