int getIndex(String location) {
  if (location.startsWith('/home')) return 0;
  if (location.startsWith('/categories')) return 1;
  if (location.startsWith('/cart')) return 2;
  if (location.startsWith('/favorites')) return 3;
  if (location.startsWith('/location')) return 4;
  return 0;
}

String getPath(int index) {
  switch (index) {
    case 0:
      return '/home';
    case 1:
      return '/categories';
    case 2:
      return '/cart';
    case 3:
      return '/favorites';
    case 4:
      return '/location';
    default:
      return '/home';
  }
}
