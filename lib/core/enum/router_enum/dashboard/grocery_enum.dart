enum GroceryEnum {
  grocery(path: '/dashboard/grocery', name: 'grocery');

  final String path;
  final String name;

  const GroceryEnum({required this.path, required this.name});
}
