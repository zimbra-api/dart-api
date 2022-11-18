// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

/// Individual right information
class RightPermission {
  /// If set then the authed user has the right {right-name} on the target.
  final bool allow;

  /// Right name
  final String? rightName;

  const RightPermission({this.allow = false, this.rightName});

  factory RightPermission.fromMap(Map<String, dynamic> data) =>
      RightPermission(allow: data['allow'] ?? false, rightName: data['_content']);

  Map<String, dynamic> toMap() => {
        'allow': allow,
        if (rightName != null) '_content': rightName,
      };
}
