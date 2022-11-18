// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'imap_message_info.dart';
import 'modify_notification.dart';

class ModifyItemNotification extends ModifyNotification {
  /// Modified IMAP message
  final ImapMessageInfo? messageInfo;

  const ModifyItemNotification({this.messageInfo, super.changeBitmask});

  factory ModifyItemNotification.fromMap(Map<String, dynamic> data) => ModifyItemNotification(
      changeBitmask: data['change'] ?? 0, messageInfo: data['m'] is Map ? ImapMessageInfo.fromMap(data['m']) : null);

  @override
  Map<String, dynamic> toMap() => {
        'change': changeBitmask,
        if (messageInfo != null) 'm': messageInfo!.toMap(),
      };
}
