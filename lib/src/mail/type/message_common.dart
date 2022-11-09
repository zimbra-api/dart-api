// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'mail_custom_metadata.dart';

class MessageCommon {
  /// Size in bytes
  final int? size;

  /// Date seconds since the epoch, from the date header in the message
  final int? date;

  /// Folder ID
  final String? folder;

  /// Converstation ID
  final String? conversationId;

  /// Flags.  (u)nread, (f)lagged, has (a)ttachment, (r)eplied, (s)ent by me,
  /// for(w)arded, calendar in(v)ite, (d)raft, IMAP-\Deleted (x), (n)otification sent, urgent (!),
  /// low-priority (?), priority (+)
  final String? flags;

  /// Tags - Comma separated list of ints.  DEPRECATED - use "tn" instead
  final String? tags;

  /// Comma separated list of tag names
  final String? tagNames;

  /// Revision
  final int? revision;

  /// Date metadata changed
  final int? changeDate;

  /// Change sequence
  final int? modifiedSequence;

  /// Custom metadata information
  final List<MailCustomMetadata> metadatas;

  MessageCommon(
      {this.size,
      this.date,
      this.folder,
      this.conversationId,
      this.flags,
      this.tags,
      this.tagNames,
      this.revision,
      this.changeDate,
      this.modifiedSequence,
      this.metadatas = const []});

  factory MessageCommon.fromMap(Map<String, dynamic> data) => MessageCommon(
      size: int.tryParse(data['s']?.toString() ?? ''),
      date: int.tryParse(data['d']?.toString() ?? ''),
      folder: data['l'],
      conversationId: data['cid'],
      flags: data['f'],
      tags: data['t'],
      tagNames: data['tn'],
      revision: int.tryParse(data['rev']?.toString() ?? ''),
      changeDate: int.tryParse(data['md']?.toString() ?? ''),
      modifiedSequence: int.tryParse(data['ms']?.toString() ?? ''),
      metadatas: (data['meta'] is Iterable)
          ? List.from((data['meta'] as Iterable).map<MailCustomMetadata>((meta) => MailCustomMetadata.fromMap(meta)))
          : []);

  Map<String, dynamic> toMap() => {
        if (size != null) 's': size,
        if (date != null) 'd': date,
        if (folder != null) 'l': folder,
        if (conversationId != null) 'cid': conversationId,
        if (flags != null) 'f': flags,
        if (tags != null) 't': tags,
        if (tagNames != null) 'tn': tagNames,
        if (revision != null) 'rev': revision,
        if (changeDate != null) 'md': changeDate,
        if (modifiedSequence != null) 'ms': modifiedSequence,
        if (metadatas.isNotEmpty) 'meta': metadatas.map((meta) => meta.toMap()).toList(),
      };
}
