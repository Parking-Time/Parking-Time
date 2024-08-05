import 'package:intl/intl.dart';

extension IntExtensions on int {

  String toNumberFormat() {
    final formatter = NumberFormat('###,###,###,###');
    return formatter.format(this);
  }

}