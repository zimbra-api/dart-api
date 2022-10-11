// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

/// By-hour rule
class ByHourRule {
  /// Comma separated list of hours where hour is a number between 0 and 23
  final String list;

  ByHourRule(this.list);

  factory ByHourRule.fromJson(Map<String, dynamic> json) => ByHourRule(json['hrlist'] ?? '');

  Map<String, dynamic> toJson() => {
        'hrlist': list,
      };
}
