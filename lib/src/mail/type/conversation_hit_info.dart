// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'conversation_msg_hit_info.dart';
import 'conversation_summary.dart';
import 'email_info.dart';
import 'mail_custom_metadata.dart';

/// Conversation search result information
class ConversationHitInfo extends ConversationSummary {
  /// Sort field value
  final String? sortField;

  final List<ConversationMsgHitInfo> messageHits;

  ConversationHitInfo(
      {this.sortField,
      this.messageHits = const [],
      super.id,
      super.numMsg,
      super.numUnread,
      super.totalSize,
      super.flags,
      super.tags,
      super.tagNames,
      super.date,
      super.elided,
      super.changeDate,
      super.modifiedSequence,
      super.metadatas = const [],
      super.subject,
      super.fragment,
      super.emails = const []});

  factory ConversationHitInfo.fromJson(Map<String, dynamic> json) => ConversationHitInfo(
      sortField: json['sf'],
      messageHits: (json['m'] is Iterable)
          ? List.from((json['m'] as Iterable).map<ConversationMsgHitInfo>((m) => ConversationMsgHitInfo.fromJson(m)))
          : [],
      id: json['id'],
      numMsg: json['n'],
      numUnread: json['u'],
      totalSize: json['total'],
      flags: json['f'],
      tags: json['t'],
      tagNames: json['tn'],
      date: json['d'],
      elided: json['elided'],
      changeDate: json['md'],
      modifiedSequence: json['ms'],
      metadatas: (json['meta'] is Iterable)
          ? List.from((json['meta'] as Iterable).map<MailCustomMetadata>((meta) => MailCustomMetadata.fromJson(meta)))
          : [],
      subject: json['su']?['_content'],
      fragment: json['fr']?['_content'],
      emails: (json['e'] is Iterable)
          ? List.from((json['e'] as Iterable).map<EmailInfo>((e) => EmailInfo.fromJson(e)))
          : []);

  @override
  Map<String, dynamic> toJson() => {
        if (sortField != null) 'sf': sortField,
        if (messageHits.isNotEmpty) 'm': messageHits.map((m) => m.toJson()).toList(),
        if (id != null) 'id': id,
        if (numMsg != null) 'n': numMsg,
        if (numUnread != null) 'u': numUnread,
        if (totalSize != null) 'total': totalSize,
        if (flags != null) 'f': flags,
        if (tags != null) 't': tags,
        if (tagNames != null) 'tn': tagNames,
        if (date != null) 'd': date,
        if (elided != null) 'elided': elided,
        if (changeDate != null) 'md': changeDate,
        if (modifiedSequence != null) 'ms': modifiedSequence,
        if (metadatas.isNotEmpty) 'meta': metadatas.map((meta) => meta.toJson()).toList(),
        if (subject != null) 'su': {'_content': subject},
        if (fragment != null) 'fr': {'_content': fragment},
        if (emails.isNotEmpty) 'e': emails.map((e) => e.toJson()).toList(),
      };
}
