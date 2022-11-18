// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/enum/week_day.dart';

/// Week-start rule
class WkstRule {
  /// Weekday -  SU|MO|TU|WE|TH|FR|SA
  final WeekDay day;

  const WkstRule(this.day);

  factory WkstRule.fromMap(Map<String, dynamic> data) => WkstRule(WeekDay.values.firstWhere(
        (item) => item.name == data['day'],
        orElse: () => WeekDay.sunday,
      ));

  Map<String, dynamic> toMap() => {
        'day': day.name,
      };
}
