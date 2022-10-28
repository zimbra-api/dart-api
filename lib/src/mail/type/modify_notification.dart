// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

class ModifyNotification {
  /// Bitmask of modification change
  final int changeBitmask;

  ModifyNotification({this.changeBitmask = 0});

  factory ModifyNotification.fromJson(Map<String, dynamic> json) =>
      ModifyNotification(changeBitmask: json['change'] ?? 0);

  Map<String, dynamic> toJson() => {
        'change': changeBitmask,
      };
}
