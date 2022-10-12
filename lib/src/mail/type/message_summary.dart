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

  factory MessageSummary.fromJson(Map<String, dynamic> json) => MessageSummary(
        json['id'] ?? '',
        autoSendTime: json['autoSendTime'],
        emails: (json['e'] is Iterable)
            ? List.from((json['e'] as Iterable).map<EmailInfo>((e) => EmailInfo.fromJson(e)))
            : [],
        subject: json['su']?['_content'],
        fragment: json['fr']?['_content'],
        invite: json['inv'] is Map ? InviteInfo.fromJson(json['inv']) : null,
        size: json['s'],
        date: json['d'],
        folder: json['l'],
        conversationId: json['cid'],
        flags: json['f'],
        tags: json['t'],
        tagNames: json['tn'],
        revision: json['rev'],
        changeDate: json['md'],
        modifiedSequence: json['ms'],
        metadatas: (json['meta'] is Iterable)
            ? List.from((json['meta'] as Iterable).map<MailCustomMetadata>((meta) => MailCustomMetadata.fromJson(meta)))
            : [],
      );

  @override
  Map<String, dynamic> toJson() => {
        'id': id,
        if (autoSendTime != null) 'autoSendTime': autoSendTime,
        if (emails.isNotEmpty) 'e': emails.map((e) => e.toJson()).toList(),
        if (subject != null) 'su': {'_content': subject},
        if (fragment != null) 'fr': {'_content': fragment},
        if (invite != null) 'inv': invite!.toJson(),
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
        if (metadatas.isNotEmpty) 'meta': metadatas.map((meta) => meta.toJson()).toList(),
      };
}
