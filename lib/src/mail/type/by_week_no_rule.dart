// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

/// By-week-no rule
class ByWeekNoRule {
  /// BYWEEKNO Week list.  Format : [[+]|-]num[,...] where num is between 1 and 53
  /// e.g. wklist="1,+2,-1" means first week, 2nd week, and last week of the year.
  final String list;

  const ByWeekNoRule(this.list);

  factory ByWeekNoRule.fromMap(Map<String, dynamic> data) => ByWeekNoRule(data['wklist'] ?? '');

  Map<String, dynamic> toMap() => {
        'wklist': list,
      };
}
