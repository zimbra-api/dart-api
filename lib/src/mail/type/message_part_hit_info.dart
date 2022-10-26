// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'email_info.dart';

class MessagePartHitInfo {
  /// Message ID
  final String? id;

  /// Sort field value
  final String? sortField;

  /// Size in bytes
  final int? size;

  /// Secs since epoch, from date header in message
  final int? date;

  /// Converstation id. only present if <m> is not enclosed within a <c> element
  final int? conversationId;

  /// Message item ID
  final int? messageId;

  /// Content type
  final String? contentType;

  /// File name
  final String? contentName;

  /// MIME part name
  final String? part;

  final EmailInfo? email;

  /// Subject
  final String? subject;

  MessagePartHitInfo(
      {this.id,
      this.sortField,
      this.size,
      this.date,
      this.conversationId,
      this.messageId,
      this.contentType,
      this.contentName,
      this.part,
      this.email,
      this.subject});
  factory MessagePartHitInfo.fromJson(Map<String, dynamic> json) => MessagePartHitInfo(
      id: json['id'],
      sortField: json['sf'],
      size: json['s'],
      date: json['d'],
      conversationId: json['cid'],
      messageId: json['mid'],
      contentType: json['ct'],
      contentName: json['name'],
      part: json['part'],
      email: json['e'] is Map ? EmailInfo.fromJson(json['e']) : null,
      subject: json['su']?['_content']);

  Map<String, dynamic> toJson() => {
        if (id != null) 'id': id,
        if (sortField != null) 'sf': sortField,
        if (size != null) 's': size,
        if (date != null) 'd': date,
        if (conversationId != null) 'cid': conversationId,
        if (messageId != null) 'mid': messageId,
        if (contentType != null) 'ct': contentType,
        if (contentName != null) 'name': contentName,
        if (part != null) 'part': part,
        if (email != null) 'e': email!.toJson(),
        if (subject != null) 'su': {'_content': subject},
      };
}
