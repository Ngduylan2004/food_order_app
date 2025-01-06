enum ForumEnum {
  forum(path: '/dashboard/forum', name: 'forum'),
  topic(path: '/dashboard/forum/topic', name: 'topic'),
  challenge(path: '/dashboard/forum/challenge', name: 'challenge'),
  group(path: '/dashboard/forum/group', name: 'group'),
  groupChild(path: '/dashboard/forum/group/group-child', name: 'group-child');

  final String path;
  final String name;

  const ForumEnum({required this.path, required this.name});
}
