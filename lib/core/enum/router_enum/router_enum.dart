enum RouterEnum {
  // màn hình chờ
  splash(path: '/', name: 'splash'),

  // màn hình đăng nhập
  login(path: '/login', name: 'login'),
  passwordRecovery(path: '/login/password-recovery', name: 'password-recovery'),
  checkEmail(path: '/login/check-email', name: 'check-email'),
  resetPassword(path: '/login/reset-password', name: 'reset-password'),

  // màn hình đăng ký
  register(path: '/register', name: 'register'),
  registerStep(path: '/register/step', name: 'register-step'),

  // màn hình dashboard
  dashboard(path: '/dashboard', name: 'dashboard'),

  // màn hình home
  home(path: '/home', name: 'home'),

  // màn hình grocery
  grocery(path: '/grocery', name: 'grocery'),

  // màn hình explore
  explore(path: '/explore', name: 'explore'),
  category(path: '/explore/category', name: 'category'),
  supCategory(path: '/explore/category/sup-category', name: 'sup-category'),

  // màn hình forum
  forum(path: '/forum', name: 'forum'),
  topic(path: '/forum/topic', name: 'topic'),
  challenge(path: '/forum/challenge', name: 'challenge'),
  group(path: '/forum/group', name: 'group'),
  groupChild(path: '/forum/group/group-child', name: 'group-child'),

  // màn hình profile
  profile(path: '/profile', name: 'profile'),

  // màn hình detail
  detail(path: '/recipe-detail', name: 'recipe-detail'),
  imageDetail(path: '/recipe-detail/image', name: 'image-detail');

  final String path;
  final String name;

  const RouterEnum({required this.path, required this.name});
}
