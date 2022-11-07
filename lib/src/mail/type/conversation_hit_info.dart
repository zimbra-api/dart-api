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

  factory ConversationHitInfo.fromMap(Map<String, dynamic> data) => ConversationHitInfo(
      sortField: data['sf'],
      messageHits: (data['m'] is Iterable)
          ? List.from((data['m'] as Iterable).map<ConversationMsgHitInfo>((m) => ConversationMsgHitInfo.fromMap(m)))
          : [],
      id: data['id'],
      numMsg: data['n'],
      numUnread: data['u'],
      totalSize: data['total'],
      flags: data['f'],
      tags: data['t'],
      tagNames: data['tn'],
      date: data['d'],
      elided: data['elided'],
      changeDate: data['md'],
      modifiedSequence: data['ms'],
      metadatas: (data['meta'] is Iterable)
          ? List.from((data['meta'] as Iterable).map<MailCustomMetadata>((meta) => MailCustomMetadata.fromMap(meta)))
          : [],
      subject: data['su'],
      fragment: data['fr'],
      emails: (data['e'] is Iterable)
          ? List.from((data['e'] as Iterable).map<EmailInfo>((e) => EmailInfo.fromMap(e)))
          : []);

  @override
  Map<String, dynamic> toMap() => {
        if (sortField != null) 'sf': sortField,
        if (messageHits.isNotEmpty) 'm': messageHits.map((m) => m.toMap()).toList(),
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
        if (metadatas.isNotEmpty) 'meta': metadatas.map((meta) => meta.toMap()).toList(),
        if (subject != null) 'su': subject,
        if (fragment != null) 'fr': fragment,
        if (emails.isNotEmpty) 'e': emails.map((e) => e.toMap()).toList(),
      };
}
