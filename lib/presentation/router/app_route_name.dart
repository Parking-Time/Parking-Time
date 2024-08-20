enum AppRouteName {
  // 하단 탭 routes
  home('home'),
  favorite('favorite'),
  profile('profile'),

  // 페이지 routes
  admin('admin'),
  createParkingLot('create_parking_lot'),

  // 다이얼로그 routes
  bottomSheetDialog('bottom_sheet_dialog'),
  defaultDialog('default_dialog'),
  ;

  const AppRouteName(this.name);

  final String name;

}