// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

class CheckRightsRightInfo {
  /// Flags whether the authed user has the right on the target
  final bool allow;

  /// Name of right
  final String right;

  const CheckRightsRightInfo({this.right = '', this.allow = false});

  factory CheckRightsRightInfo.fromMap(Map<String, dynamic> data) =>
      CheckRightsRightInfo(allow: data['allow'], right: data['_content']);

  Map<String, dynamic> toMap() => {
        'allow': allow,
        '_content': right,
      };
}
