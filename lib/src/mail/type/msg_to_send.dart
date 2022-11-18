// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/enum/reply_type.dart';

import 'attachments_info.dart';
import 'cal_tz_info.dart';
import 'email_addr_info.dart';
import 'header.dart';
import 'invitation_info.dart';
import 'mime_part_info.dart';
import 'msg.dart';

/// Message to send input.
class MsgToSend extends Msg {
  /// Saved draft ID
  final String? draftId;

  /// If set, message gets constructed based on the "did" (id of the draft).
  final bool? sendFromDraft;

  /// Id of the data source in case SMTP settings of that data source must be used for sending the message.
  final String? dataSourceId;

  const MsgToSend({
    this.draftId,
    this.sendFromDraft,
    this.dataSourceId,
    super.attachmentId,
    super.origId,
    super.replyType,
    super.identityId,
    super.subject,
    super.headers = const [],
    super.inReplyTo,
    super.folderId,
    super.flags,
    super.content,
    super.mimePart,
    super.attachments,
    super.invite,
    super.emailAddresses = const [],
    super.timezones = const [],
    super.fragment,
  });

  factory MsgToSend.fromMap(Map<String, dynamic> data) => MsgToSend(
      draftId: data['did'],
      sendFromDraft: data['sfd'],
      dataSourceId: data['dsId'],
      attachmentId: data['aid'],
      origId: data['origid'],
      replyType: ReplyType.values.firstWhere(
        (rt) => rt.name == data['rt'],
        orElse: () => ReplyType.replied,
      ),
      identityId: data['idnt'],
      subject: data['su'],
      headers: (data['header'] is Iterable)
          ? (data['header'] as Iterable).map<Header>((header) => Header.fromMap(header)).toList(growable: false)
          : const [],
      inReplyTo: data['irt'],
      folderId: data['l'],
      flags: data['f'],
      content: data['content']?['_content'],
      mimePart: (data['mp'] is Map) ? MimePartInfo.fromMap(data['mp']) : null,
      attachments: (data['attach'] is Map) ? AttachmentsInfo.fromMap(data['attach']) : null,
      invite: (data['inv'] is Map) ? InvitationInfo.fromMap(data['inv']) : null,
      emailAddresses: (data['e'] is Iterable)
          ? (data['e'] as Iterable).map<EmailAddrInfo>((e) => EmailAddrInfo.fromMap(e)).toList(growable: false)
          : const [],
      timezones: (data['tz'] is Iterable)
          ? (data['tz'] as Iterable).map<CalTZInfo>((tz) => CalTZInfo.fromMap(tz)).toList(growable: false)
          : const [],
      fragment: data['fr']);

  @override
  Map<String, dynamic> toMap() => {
        if (draftId != null) 'did': draftId,
        if (sendFromDraft != null) 'sfd': sendFromDraft,
        if (dataSourceId != null) 'dsId': dataSourceId,
        if (attachmentId != null) 'aid': attachmentId,
        if (origId != null) 'origid': origId,
        if (replyType != null) 'rt': replyType!.name,
        if (identityId != null) 'idnt': identityId,
        if (subject != null) 'su': subject,
        if (headers.isNotEmpty) 'header': headers.map((header) => header.toMap()).toList(growable: false),
        if (inReplyTo != null) 'irt': inReplyTo,
        if (folderId != null) 'l': folderId,
        if (flags != null) 'f': flags,
        if (content != null) 'content': {'_content': content},
        if (mimePart != null) 'mp': mimePart!.toMap(),
        if (attachments != null) 'attach': attachments!.toMap(),
        if (invite != null) 'inv': invite!.toMap(),
        if (emailAddresses.isNotEmpty) 'e': emailAddresses.map((e) => e.toMap()).toList(growable: false),
        if (timezones.isNotEmpty) 'tz': timezones.map((tz) => tz.toMap()).toList(growable: false),
        if (fragment != null) 'fr': fragment,
      };
}
