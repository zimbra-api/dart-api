// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'email_info.dart';
import 'invite_info.dart';
import 'mail_custom_metadata.dart';
import 'message_summary.dart';

class ChatSummary extends MessageSummary {
  ChatSummary(super.id,
      {super.autoSendTime,
      super.emails = const [],
      super.subject,
      super.fragment,
      super.invite,
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

  factory ChatSummary.fromJson(Map<String, dynamic> json) => ChatSummary(
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
}
