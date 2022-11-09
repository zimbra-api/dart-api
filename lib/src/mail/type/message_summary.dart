// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'email_info.dart';
import 'invite_info.dart';
import 'mail_custom_metadata.dart';
import 'message_common.dart';

class MessageSummary extends MessageCommon {
  /// Message ID
  final String id;

  /// Auto send time
  final int? autoSendTime;

  /// Email address information
  final List<EmailInfo> emails;

  /// Subject
  final String? subject;

  /// First few bytes of the message (probably between 40 and 100 bytes)
  final String? fragment;

  /// Invite information
  final InviteInfo? invite;

  MessageSummary(this.id,
      {this.autoSendTime,
      this.emails = const [],
      this.subject,
      this.fragment,
      this.invite,
      super.size,
      super.date,
      super.folder,
      super.conversationId,
      super.flags,
      super.tags,
      super.tagNames,
      super.revision,
      super.changeDate,
      super.modifiedSequence,
      super.metadatas = const []});

  factory MessageSummary.fromMap(Map<String, dynamic> data) => MessageSummary(data['id'] ?? '',
      autoSendTime: int.tryParse(data['autoSendTime']?.toString() ?? ''),
      emails:
          (data['e'] is Iterable) ? List.from((data['e'] as Iterable).map<EmailInfo>((e) => EmailInfo.fromMap(e))) : [],
      subject: data['su'],
      fragment: data['fr'],
      invite: data['inv'] is Map ? InviteInfo.fromMap(data['inv']) : null,
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

  @override
  Map<String, dynamic> toMap() => {
        'id': id,
        if (autoSendTime != null) 'autoSendTime': autoSendTime,
        if (emails.isNotEmpty) 'e': emails.map((e) => e.toMap()).toList(),
        if (subject != null) 'su': subject,
        if (fragment != null) 'fr': fragment,
        if (invite != null) 'inv': invite!.toMap(),
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
