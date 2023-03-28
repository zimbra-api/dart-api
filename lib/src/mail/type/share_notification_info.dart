// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'grantor.dart';
import 'link_info.dart';

class ShareNotificationInfo {
  /// Status - "new" if the message is unread or "seen" if the message is read.
  final String? status;

  /// The item ID of the share notification message.
  /// The message must be in the Inbox folder.
  final String? id;

  /// Date
  final int? date;

  /// Grantor information
  final Grantor? grantor;

  /// Link information
  final LinkInfo? link;

  const ShareNotificationInfo({
    this.status,
    this.id,
    this.date,
    this.grantor,
    this.link,
  });

  factory ShareNotificationInfo.fromMap(
    Map<String, dynamic> data,
  ) =>
      ShareNotificationInfo(
        status: data['status'],
        id: data['id'],
        date: int.tryParse(data['d']?.toString() ?? ''),
        grantor: data['grantor'] is Map
            ? Grantor.fromMap(
                data['grantor'],
              )
            : null,
        link: data['link'] is Map
            ? LinkInfo.fromMap(
                data['link'],
              )
            : null,
      );

  Map<String, dynamic> toMap() => {
        if (status != null) 'status': status,
        if (id != null) 'id': id,
        if (date != null) 'd': date,
        if (grantor != null) 'grantor': grantor!.toMap(),
        if (link != null) 'link': link!.toMap(),
      };
}
