// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'imap_message_info.dart';

class CreateItemNotification {
  /// Message info of created item
  final ImapMessageInfo? messageInfo;

  const CreateItemNotification({this.messageInfo});

  factory CreateItemNotification.fromMap(Map<String, dynamic> data) =>
      CreateItemNotification(messageInfo: data['m'] is Map ? ImapMessageInfo.fromMap(data['m']) : null);

  Map<String, dynamic> toMap() => {
        if (messageInfo != null) 'm': messageInfo!.toMap(),
      };
}
