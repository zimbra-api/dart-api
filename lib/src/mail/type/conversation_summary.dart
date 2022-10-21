// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'email_info.dart';
import 'mail_custom_metadata.dart';

/// Conversation search result information
class ConversationSummary {
  /// Conversation ID
  final String? id;

  /// Number of messages in conversation without IMAP \Deleted flag set
  final int? num;

  /// Number of unread messages in conversation
  final int? numUnread;

  /// Total number of messages in conversation including those with the IMAP \Deleted flag set
  final int? totalSize;

  /// Same flags as on <m> ("sarwfdxnu!?"), aggregated from all the conversation's messages
  final String? flags;

  /// Tags - Comma separated list of ints.  DEPRECATED - use "tn" instead
  final String? tags;

  /// Comma-separated list of tag names
  final String? tagNames;

  /// Date (secs since epoch) of most recent message in the converstation
  final int? date;

  /// If elided is set, some participants are missing before the first returned <e> element
  final bool? elided;

  /// Modified date in seconds
  final int? changeDate;

  /// Modified sequence
  final int? modifiedSequence;

  /// Custom metadata
  final List<MailCustomMetadata> metadatas;

  /// Subject of conversation
  final String? subject;

  /// First few bytes of the message (probably between 40 and 100 bytes)
  final String? fragment;

  /// Email addresses
  final List<EmailInfo> emails;

  ConversationSummary(
      {this.id,
      this.num,
      this.numUnread,
      this.totalSize,
      this.flags,
      this.tags,
      this.tagNames,
      this.date,
      this.elided,
      this.changeDate,
      this.modifiedSequence,
      this.metadatas = const [],
      this.subject,
      this.fragment,
      this.emails = const []});

  factory ConversationSummary.fromJson(Map<String, dynamic> json) => ConversationSummary(
      id: json['id'],
      num: json['n'],
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

  Map<String, dynamic> toJson() => {
        if (id != null) 'id': id,
        if (num != null) 'n': num,
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
