enum AppRouteName {
  home('/'),
  create('/parking-lot/create'),
  update('/parking-lot/:id/update');

  final String name;
  const AppRouteName(this.name);
}