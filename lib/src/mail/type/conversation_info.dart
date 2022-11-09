// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'mail_custom_metadata.dart';
import 'message_info.dart';

class ConversationInfo {
  /// Conversation ID
  final String? id;

  /// Number of (nondeleted) messages
  final int? num;

  /// Total number of messages (including deleted messages).
  /// Only included if value differs from {num-msgs}
  final int? totalSize;

  /// Flags
  final String? flags;

  /// Tags - Comma separated list of ints. DEPRECATED - use "tn" instead
  final String? tags;

  /// Comma-separated list of tag names
  final String? tagNames;

  /// Metadata and the subject as text
  final List<MailCustomMetadata> metadatas;

  /// Subject
  final String? subject;

  /// Chat messages
  final List<MessageInfo> chatMessages;

  /// Messages
  final List<MessageInfo> messages;

  ConversationInfo(
      {this.id,
      this.num,
      this.totalSize,
      this.flags,
      this.tags,
      this.tagNames,
      this.metadatas = const [],
      this.subject,
      this.chatMessages = const [],
      this.messages = const []});

  factory ConversationInfo.fromMap(Map<String, dynamic> data) => ConversationInfo(
      id: data['id'],
      num: int.tryParse(data['n']?.toString() ?? ''),
      totalSize: int.tryParse(data['total']?.toString() ?? ''),
      flags: data['f'],
      tags: data['t'],
      tagNames: data['tn'],
      metadatas: (data['meta'] is Iterable)
          ? List.from((data['meta'] as Iterable).map<MailCustomMetadata>((meta) => MailCustomMetadata.fromMap(meta)))
          : [],
      subject: data['su'],
      chatMessages: (data['chat'] is Iterable)
          ? List.from((data['chat'] as Iterable).map<MessageInfo>((chat) => MessageInfo.fromMap(chat)))
          : [],
      messages: (data['m'] is Iterable)
          ? List.from((data['m'] as Iterable).map<MessageInfo>((m) => MessageInfo.fromMap(m)))
          : []);

  Map<String, dynamic> toMap() => {
        if (id != null) 'id': id,
        if (num != null) 'n': num,
        if (totalSize != null) 'total': totalSize,
        if (flags != null) 'f': flags,
        if (tags != null) 't': tags,
        if (tagNames != null) 'tn': tagNames,
        if (metadatas.isNotEmpty) 'meta': metadatas.map((meta) => meta.toMap()).toList(),
        if (subject != null) 'su': subject,
        if (chatMessages.isNotEmpty) 'chat': chatMessages.map((chat) => chat.toMap()).toList(),
        if (messages.isNotEmpty) 'm': messages.map((m) => m.toMap()).toList(),
      };
}
