// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

/// By-minute rule
class ByMinuteRule {
  /// Comma separated list of minutes where minute is a number between 0 and 59
  final String list;

  ByMinuteRule(this.list);

  factory ByMinuteRule.fromJson(Map<String, dynamic> json) => ByMinuteRule(json['minlist'] ?? '');

  Map<String, dynamic> toJson() => {
        'minlist': list,
      };
}
