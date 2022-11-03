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

  factory ModifyTagNotification.fromMap(Map<String, dynamic> data) => ModifyTagNotification(
      id: data['id']?['_content'] ?? 0, name: data['name']?['_content'] ?? 0, changeBitmask: data['change'] ?? 0);

  @override
  Map<String, dynamic> toMap() => {
        'id': {'_content': id},
        'name': {'_content': name},
        'change': changeBitmask,
      };
}
