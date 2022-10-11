// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

/// Interval rule
class IntervalRule {
  /// Rule interval count - a positive int
  final int ival;

  IntervalRule(this.ival);

  factory IntervalRule.fromJson(Map<String, dynamic> json) => IntervalRule(json['ival'] ?? 0);

  Map<String, dynamic> toJson() => {
        'ival': ival,
      };
}