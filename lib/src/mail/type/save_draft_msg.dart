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

class SaveDraftMsg extends Msg {
  /// Existing draft ID
  final int? id;

  /// Account ID the draft is for
  final String? draftAccountId;

  /// Tags - Comma separated list of ints.  DEPRECATED - use "tn" instead
  final String? tags;

  /// Comma separated list of tag names
  final String? tagNames;

  /// RGB color in format #rrggbb where r,g and b are hex digits
  final String? rgb;

  /// Color numeric; range 0-127; defaults to 0 if not present; client can display only 0-7
  final int? color;

  /// Auto send time in milliseconds since the epoch
  final int? autoSendTime;

  SaveDraftMsg({
    this.id,
    this.draftAccountId,
    this.tags,
    this.tagNames,
    this.rgb,
    this.color,
    this.autoSendTime,
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

  factory SaveDraftMsg.fromJson(Map<String, dynamic> json) => SaveDraftMsg(
      id: json['id'],
      draftAccountId: json['forAcct'],
      tags: json['t'],
      tagNames: json['tn'],
      rgb: json['rgb'],
      color: json['color'],
      autoSendTime: json['autoSendTime'],
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
        if (id != null) 'id': id,
        if (draftAccountId != null) 'forAcct': draftAccountId,
        if (tags != null) 't': tags,
        if (tagNames != null) 'tn': tagNames,
        if (rgb != null) 'rgb': rgb,
        if (color != null) 'color': color,
        if (autoSendTime != null) 'autoSendTime': autoSendTime,
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
