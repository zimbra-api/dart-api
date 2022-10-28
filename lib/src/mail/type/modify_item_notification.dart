// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'imap_message_info.dart';
import 'modify_notification.dart';

class ModifyItemNotification extends ModifyNotification {
  /// Modified IMAP message
  final ImapMessageInfo? messageInfo;

  ModifyItemNotification({this.messageInfo, super.changeBitmask});

  factory ModifyItemNotification.fromJson(Map<String, dynamic> json) => ModifyItemNotification(
      changeBitmask: json['change'] ?? 0, messageInfo: json['m'] is Map ? ImapMessageInfo.fromJson(json['m']) : null);

  @override
  Map<String, dynamic> toJson() => {
        'change': changeBitmask,
        if (messageInfo != null) 'm': messageInfo!.toJson(),
      };
}
