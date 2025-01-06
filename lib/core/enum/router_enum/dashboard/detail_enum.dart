enum DetailEnum {
  detail(path: '/dashboard/recipe-detail', name: 'recipe-detail'),
  imageDetail(path: '/dashboard/recipe-detail/image', name: 'image-detail');

  final String path;
  final String name;

  const DetailEnum({required this.path, required this.name});
}
