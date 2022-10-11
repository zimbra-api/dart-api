// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'wk_day.dart';

/// By-day rule
class ByDayRule {
  /// By day weekday rule specification
  final List<WkDay> days;

  ByDayRule({this.days = const []});

  factory ByDayRule.fromJson(Map<String, dynamic> json) {
    final days = <WkDay>[];
    if (json['wkday'] != null && json['wkday'] is Iterable) {
      final elements = json['wkday'] as Iterable;
      for (final skin in elements) {
        days.add(WkDay.fromJson(skin));
      }
    }
    return ByDayRule(days: days);
  }

  Map<String, dynamic> toJson() => {
        if (days.isNotEmpty) 'wkday': days.map((wkday) => wkday.toJson()).toList(),
      };
}
