// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

/// By-minute rule
class ByMinuteRule {
  /// Comma separated list of minutes where minute is a number between 0 and 59
  final String list;

  const ByMinuteRule(this.list);

  factory ByMinuteRule.fromMap(Map<String, dynamic> data) => ByMinuteRule(
        data['minlist'] ?? '',
      );

  Map<String, dynamic> toMap() => {
        'minlist': list,
      };
}
