// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'modify_notification.dart';

class ModifyTagNotification extends ModifyNotification {
  /// ID of modified tag
  final int id;

  /// Name of modified tag
  final String name;

  ModifyTagNotification({this.id = 0, this.name = '', super.changeBitmask});

  factory ModifyTagNotification.fromJson(Map<String, dynamic> json) => ModifyTagNotification(
      id: json['id']?['_content'] ?? 0, name: json['name']?['_content'] ?? 0, changeBitmask: json['change'] ?? 0);

  @override
  Map<String, dynamic> toJson() => {
        'id': {'_content': id},
        'name': {'_content': name},
        'change': changeBitmask,
      };
}
