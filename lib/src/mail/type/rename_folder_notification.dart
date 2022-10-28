// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'modify_notification.dart';

class RenameFolderNotification extends ModifyNotification {
  /// ID of renamed folder
  final int folderId;

  final String path;

  RenameFolderNotification({this.folderId = 0, this.path = '', super.changeBitmask});

  factory RenameFolderNotification.fromJson(Map<String, dynamic> json) =>
      RenameFolderNotification(folderId: json['id'] ?? 0, path: json['path'] ?? 0, changeBitmask: json['change'] ?? 0);

  @override
  Map<String, dynamic> toJson() => {
        'id': folderId,
        'path': path,
        'change': changeBitmask,
      };
}
