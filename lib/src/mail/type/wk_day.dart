// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/enum/week_day.dart';

class WkDay {
  /// Weekday -  SU|MO|TU|WE|TH|FR|SA
  final WeekDay day;

  /// Week number.  [[+]|-]num: 1 to 53
  final int? ordWk;

  const WkDay(this.day, {this.ordWk});

  factory WkDay.fromMap(Map<String, dynamic> data) => WkDay(
      WeekDay.values.firstWhere(
        (item) => item.name == data['day'],
        orElse: () => WeekDay.sunday,
      ),
      ordWk: int.tryParse(data['ordWk']?.toString() ?? ''));

  Map<String, dynamic> toMap() => {
        'day': day.name,
        if (ordWk != null) 'ordWk': ordWk,
      };
}
