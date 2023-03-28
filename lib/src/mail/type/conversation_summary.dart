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
  final int? numMsg;

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

  const ConversationSummary({
    this.id,
    this.numMsg,
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
    this.emails = const [],
  });

  factory ConversationSummary.fromMap(
    Map<String, dynamic> data,
  ) =>
      ConversationSummary(
        id: data['id'],
        numMsg: int.tryParse(data['n']?.toString() ?? ''),
        numUnread: int.tryParse(data['u']?.toString() ?? ''),
        totalSize: int.tryParse(data['total']?.toString() ?? ''),
        flags: data['f'],
        tags: data['t'],
        tagNames: data['tn'],
        date: int.tryParse(data['d']?.toString() ?? ''),
        elided: data['elided'],
        changeDate: int.tryParse(data['md']?.toString() ?? ''),
        modifiedSequence: int.tryParse(data['ms']?.toString() ?? ''),
        metadatas: (data['meta'] is Iterable)
            ? (data['meta'] as Iterable)
                .map<MailCustomMetadata>(
                  (meta) => MailCustomMetadata.fromMap(meta),
                )
                .toList(growable: false)
            : const [],
        subject: data['su'],
        fragment: data['fr'],
        emails: (data['e'] is Iterable)
            ? (data['e'] as Iterable)
                .map<EmailInfo>(
                  (e) => EmailInfo.fromMap(e),
                )
                .toList(growable: false)
            : const [],
      );

  Map<String, dynamic> toMap() => {
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
        if (metadatas.isNotEmpty)
          'meta': metadatas
              .map(
                (meta) => meta.toMap(),
              )
              .toList(growable: false),
        if (subject != null) 'su': subject,
        if (fragment != null) 'fr': fragment,
        if (emails.isNotEmpty)
          'e': emails
              .map(
                (e) => e.toMap(),
              )
              .toList(growable: false),
      };
}
