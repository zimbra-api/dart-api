// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import '../../common/enum/reply_type.dart';
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

  const SaveDraftMsg({
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

  factory SaveDraftMsg.fromMap(Map<String, dynamic> data) => SaveDraftMsg(
      id: int.tryParse(data['id']?.toString() ?? ''),
      draftAccountId: data['forAcct'],
      tags: data['t'],
      tagNames: data['tn'],
      rgb: data['rgb'],
      color: int.tryParse(data['color']?.toString() ?? ''),
      autoSendTime: int.tryParse(data['autoSendTime']?.toString() ?? ''),
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
