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

  factory ChatSummary.fromMap(Map<String, dynamic> data) => ChatSummary(
        data['id'] ?? '',
        autoSendTime: data['autoSendTime'],
        emails: (data['e'] is Iterable)
            ? List.from((data['e'] as Iterable).map<EmailInfo>((e) => EmailInfo.fromMap(e)))
            : [],
        subject: data['su'],
        fragment: data['fr'],
        invite: data['inv'] is Map ? InviteInfo.fromMap(data['inv']) : null,
        size: data['s'],
        date: data['d'],
        folder: data['l'],
        conversationId: data['cid'],
        flags: data['f'],
        tags: data['t'],
        tagNames: data['tn'],
        revision: data['rev'],
        changeDate: data['md'],
        modifiedSequence: data['ms'],
        metadatas: (data['meta'] is Iterable)
            ? List.from((data['meta'] as Iterable).map<MailCustomMetadata>((meta) => MailCustomMetadata.fromMap(meta)))
            : [],
      );
}
