// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'email_info.dart';
import 'invite_info.dart';
import 'mail_custom_metadata.dart';
import 'message_summary.dart';

class ChatSummary extends MessageSummary {
  const ChatSummary(
    super.id, {
    super.autoSendTime,
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
    super.metadatas = const [],
  });

  factory ChatSummary.fromMap(Map<String, dynamic> data) => ChatSummary(
        data['id'] ?? '',
        autoSendTime: int.tryParse(data['autoSendTime']?.toString() ?? ''),
        emails: (data['e'] is Iterable)
            ? (data['e'] as Iterable)
                .map<EmailInfo>(
                  (e) => EmailInfo.fromMap(e),
                )
                .toList(growable: false)
            : const [],
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
            ? (data['meta'] as Iterable)
                .map<MailCustomMetadata>(
                  (meta) => MailCustomMetadata.fromMap(meta),
                )
                .toList(growable: false)
            : const [],
      );
}
