// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

/// By-month rule
class ByMonthRule {
  /// Comma separated list of months where month is a number between 1 and 12
  final String list;

  ByMonthRule(this.list);

  factory ByMonthRule.fromJson(Map<String, dynamic> json) => ByMonthRule(json['molist'] ?? '');

  Map<String, dynamic> toJson() => {
        'molist': list,
      };
}
