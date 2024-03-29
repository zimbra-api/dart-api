// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

/// By-year-day rule
class ByYearDayRule {
  /// BYYEARDAY yearday list.
  /// Format : [[+]|-]num[,...] where num is between 1 and 366
  /// e.g. yrdaylist="1,+2,-1" means January 1st, January 2nd, and December 31st.
  final String list;

  const ByYearDayRule(this.list);

  factory ByYearDayRule.fromMap(Map<String, dynamic> data) => ByYearDayRule(
        data['yrdaylist'] ?? '',
      );

  Map<String, dynamic> toMap() => {
        'yrdaylist': list,
      };
}
