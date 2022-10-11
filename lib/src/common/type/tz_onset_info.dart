// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

class TzOnsetInfo {
  /// Month; 1=January, 2=February, etc.
  final int month;

  /// Transition hour (0..23)
  final int hour;

  /// Transition minute (0..59)
  final int minute;

  /// Transition second; 0..59, usually 0
  final int second;

  /// Day of month (1..31)
  final int? dayOfMonth;

  /// Week number; 1=first, 2=second, 3=third, 4=fourth, -1=last
  final int? week;

  /// Day of week; 1=Sunday, 2=Monday, etc.
  final int? dayOfWeek;

  TzOnsetInfo(this.month, this.hour, this.minute, this.second, {this.dayOfMonth, this.week, this.dayOfWeek});

  factory TzOnsetInfo.fromJson(Map<String, dynamic> json) =>
      TzOnsetInfo(json['mon'] ?? 1, json['hour'] ?? 0, json['min'] ?? 0, json['sec'] ?? 0,
          dayOfMonth: json['mday'], week: json['week'], dayOfWeek: json['wkday']);

  Map<String, dynamic> toJson() => {
        'mon': month,
        'hour': hour,
        'min': minute,
        'sec': second,
        if (dayOfMonth != null) 'mday': dayOfMonth,
        if (week != null) 'week': week,
        if (dayOfWeek != null) 'wkday': dayOfWeek,
      };
}
