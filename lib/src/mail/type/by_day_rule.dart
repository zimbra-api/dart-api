// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'wk_day.dart';

/// By-day rule
class ByDayRule {
  /// By day weekday rule specification
  final List<WkDay> days;

  ByDayRule({this.days = const []});

  factory ByDayRule.fromJson(Map<String, dynamic> json) => ByDayRule(
      days: (json['wkday'] is Iterable)
          ? List.from((json['wkday'] as Iterable).map<WkDay>((wkday) => WkDay.fromJson(wkday)))
          : []);

  Map<String, dynamic> toJson() => {
        if (days.isNotEmpty) 'wkday': days.map((wkday) => wkday.toJson()).toList(),
      };
}
