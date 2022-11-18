// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

/// By-set-pos rule
class BySetPosRule {
  /// Format [[+]|-]num[,...] where num is from 1 to 366
  /// <bysetpos> MUST only be used in conjunction with another <byXXX> element.
  final String list;

  const BySetPosRule(this.list);

  factory BySetPosRule.fromMap(Map<String, dynamic> data) => BySetPosRule(data['poslist'] ?? '');

  Map<String, dynamic> toMap() => {
        'poslist': list,
      };
}
