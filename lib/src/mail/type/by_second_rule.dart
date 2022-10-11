// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

/// By-second rule
class BySecondRule {
  /// Comma separated list of seconds where second is a number between 0 and 59
  final String list;

  BySecondRule(this.list);

  factory BySecondRule.fromJson(Map<String, dynamic> json) => BySecondRule(json['seclist'] ?? '');

  Map<String, dynamic> toJson() => {
        'seclist': list,
      };
}
