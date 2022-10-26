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

  MsgToSend(
      {this.draftId,
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
      super.fragment});

  factory MsgToSend.fromJson(Map<String, dynamic> json) => MsgToSend(
      draftId: json['did'],
      sendFromDraft: json['sfd'],
      dataSourceId: json['dsId'],
      attachmentId: json['aid'],
      origId: json['origid'],
      replyType: ReplyType.values.firstWhere(
        (rt) => rt.name == json['rt'],
        orElse: () => ReplyType.replied,
      ),
      identityId: json['idnt'],
      subject: json['su'],
      headers: (json['header'] is Iterable)
          ? List.from((json['header'] as Iterable).map<Header>((header) => Header.fromJson(header)))
          : [],
      inReplyTo: json['irt'],
      folderId: json['l'],
      flags: json['f'],
      content: json['content']?['_content'],
      mimePart: (json['mp'] is Map) ? MimePartInfo.fromJson(json['mp']) : null,
      attachments: (json['attach'] is Map) ? AttachmentsInfo.fromJson(json['attach']) : null,
      invite: (json['inv'] is Map) ? InvitationInfo.fromJson(json['inv']) : null,
      emailAddresses: (json['e'] is Iterable)
          ? List.from((json['e'] as Iterable).map<EmailAddrInfo>((e) => EmailAddrInfo.fromJson(e)))
          : [],
      timezones: (json['tz'] is Iterable)
          ? List.from((json['tz'] as Iterable).map<CalTZInfo>((tz) => CalTZInfo.fromJson(tz)))
          : [],
      fragment: json['fr']?['_content']);

  @override
  Map<String, dynamic> toJson() => {
        if (draftId != null) 'did': draftId,
        if (sendFromDraft != null) 'sfd': sendFromDraft,
        if (dataSourceId != null) 'dsId': dataSourceId,
        if (attachmentId != null) 'aid': attachmentId,
        if (origId != null) 'origid': origId,
        if (replyType != null) 'rt': replyType!.name,
        if (identityId != null) 'idnt': identityId,
        if (subject != null) 'su': subject,
        if (headers.isNotEmpty) 'header': headers.map((header) => header.toJson()).toList(),
        if (inReplyTo != null) 'irt': inReplyTo,
        if (folderId != null) 'l': folderId,
        if (flags != null) 'f': flags,
        if (content != null) 'content': {'_content': content},
        if (mimePart != null) 'mp': mimePart!.toJson(),
        if (attachments != null) 'attach': attachments!.toJson(),
        if (invite != null) 'inv': invite!.toJson(),
        if (emailAddresses.isNotEmpty) 'e': emailAddresses.map((e) => e.toJson()).toList(),
        if (timezones.isNotEmpty) 'tz': timezones.map((tz) => tz.toJson()).toList(),
        if (fragment != null) 'fr': {'_content': fragment},
      };
}
