// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

/// Conversation search result information containing messages
class ConversationMsgHitInfo {
  /// Conversation ID
  final String id;

  /// Size
  final int? size;

  /// Folder ID
  final String? folderId;

  /// Flags
  final String? flags;

  /// Can optionally set autoSendTime to specify the time at which the draft should be
  /// automatically sent by the server
  final int? autoSendTime;

  /// Date
  final int? date;

  ConversationMsgHitInfo(this.id, {this.size, this.folderId, this.flags, this.autoSendTime, this.date});

  factory ConversationMsgHitInfo.fromMap(Map<String, dynamic> data) => ConversationMsgHitInfo(data['id'] ?? '',
      size: int.tryParse(data['s'] ?? ''),
      folderId: data['l'],
      flags: data['f'],
      autoSendTime: data['autoSendTime'],
      date: int.tryParse(data['d'] ?? ''));

  Map<String, dynamic> toMap() => {
        'id': id,
        if (size != null) 's': size,
        if (folderId != null) 'l': folderId,
        if (flags != null) 'f': flags,
        if (autoSendTime != null) 'autoSendTime': autoSendTime,
        if (date != null) 'd': date,
      };
}
