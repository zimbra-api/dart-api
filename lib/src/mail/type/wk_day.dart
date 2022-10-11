// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/enum/week_day.dart';

class WkDay {
  /// Weekday -  SU|MO|TU|WE|TH|FR|SA
  final WeekDay day;

  /// Week number.  [[+]|-]num: 1 to 53
  final int? ordWk;

  WkDay(this.day, {this.ordWk});

  factory WkDay.fromJson(Map<String, dynamic> json) {
    final day = WeekDay.values.firstWhere(
      (item) => item.name == json['day'],
      orElse: () => WeekDay.sunday,
    );
    return WkDay(day, ordWk: json['ordWk']);
  }

  Map<String, dynamic> toJson() => {
        'day': day.name,
        if (ordWk != null) 'ordWk': ordWk,
      };
}