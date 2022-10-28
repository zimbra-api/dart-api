// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'imap_message_info.dart';

class CreateItemNotification {
  /// Message info of created item
  final ImapMessageInfo? messageInfo;

  CreateItemNotification({this.messageInfo});

  factory CreateItemNotification.fromJson(Map<String, dynamic> json) =>
      CreateItemNotification(messageInfo: json['m'] is Map ? ImapMessageInfo.fromJson(json['m']) : null);

  Map<String, dynamic> toJson() => {
        if (messageInfo != null) 'm': messageInfo!.toJson(),
      };
}
