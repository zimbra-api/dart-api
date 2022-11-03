// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

/// By-month-day rule
class ByMonthDayRule {
  /// Comma separated list of day numbers from either the start (positive) or the
  /// end (negative) of the month - format : [[+]|-]num[,...] where num between 1 to 31
  /// e.g. modaylist="1,+2,-7"
  /// means first day of the month, plus the 2nd day of the month, plus the 7th from last day of the month.
  final String list;

  ByMonthDayRule(this.list);

  factory ByMonthDayRule.fromMap(Map<String, dynamic> data) => ByMonthDayRule(data['modaylist'] ?? '');

  Map<String, dynamic> toMap() => {
        'modaylist': list,
      };
}
