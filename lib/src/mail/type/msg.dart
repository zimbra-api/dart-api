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

/// A message
class Msg {
  /// Uploaded MIME body ID
  final String? attachmentId;

  /// Original ID
  final String? origId;

  /// Reply type - r|w.  (r)eplied or for(w)arded.
  final ReplyType? replyType;

  /// Identity ID.  The identity referenced by {identity-id} specifies the folder where the sent message is saved.
  final String? identityId;

  /// Subject
  final String? subject;

  /// Headers
  final List<Header> headers;

  /// Message-ID header for message being replied to
  final String? inReplyTo;

  /// Folder ID
  final String? folderId;

  /// Flags
  final String? flags;

  /// Content
  final String? content;

  /// Mime part information
  final MimePartInfo? mimePart;

  /// Attachments information
  final AttachmentsInfo? attachments;

  /// Invite information
  final InvitationInfo? invite;

  /// Email address information
  final List<EmailAddrInfo> emailAddresses;

  /// Timezones
  final List<CalTZInfo> timezones;

  /// First few bytes of the message (probably between 40 and 100 bytes)
  final String? fragment;

  Msg(
      {this.attachmentId,
      this.origId,
      this.replyType,
      this.identityId,
      this.subject,
      this.headers = const [],
      this.inReplyTo,
      this.folderId,
      this.flags,
      this.content,
      this.mimePart,
      this.attachments,
      this.invite,
      this.emailAddresses = const [],
      this.timezones = const [],
      this.fragment});

  factory Msg.fromMap(Map<String, dynamic> data) => Msg(
      attachmentId: data['aid'],
      origId: data['origid'],
      replyType: ReplyType.values.firstWhere(
        (rt) => rt.name == data['rt'],
        orElse: () => ReplyType.replied,
      ),
      identityId: data['idnt'],
      subject: data['su'],
      headers: (data['header'] is Iterable)
          ? List.from((data['header'] as Iterable).map<Header>((header) => Header.fromMap(header)))
          : [],
      inReplyTo: data['irt'],
      folderId: data['l'],
      flags: data['f'],
      content: data['content']?['_content'],
      mimePart: (data['mp'] is Map) ? MimePartInfo.fromMap(data['mp']) : null,
      attachments: (data['attach'] is Map) ? AttachmentsInfo.fromMap(data['attach']) : null,
      invite: (data['inv'] is Map) ? InvitationInfo.fromMap(data['inv']) : null,
      emailAddresses: (data['e'] is Iterable)
          ? List.from((data['e'] as Iterable).map<EmailAddrInfo>((e) => EmailAddrInfo.fromMap(e)))
          : [],
      timezones: (data['tz'] is Iterable)
          ? List.from((data['tz'] as Iterable).map<CalTZInfo>((tz) => CalTZInfo.fromMap(tz)))
          : [],
      fragment: data['fr']?['_content']);

  Map<String, dynamic> toMap() => {
        if (attachmentId != null) 'aid': attachmentId,
        if (origId != null) 'origid': origId,
        if (replyType != null) 'rt': replyType!.name,
        if (identityId != null) 'idnt': identityId,
        if (subject != null) 'su': subject,
        if (headers.isNotEmpty) 'header': headers.map((header) => header.toMap()).toList(),
        if (inReplyTo != null) 'irt': inReplyTo,
        if (folderId != null) 'l': folderId,
        if (flags != null) 'f': flags,
        if (content != null) 'content': {'_content': content},
        if (mimePart != null) 'mp': mimePart!.toMap(),
        if (attachments != null) 'attach': attachments!.toMap(),
        if (invite != null) 'inv': invite!.toMap(),
        if (emailAddresses.isNotEmpty) 'e': emailAddresses.map((e) => e.toMap()).toList(),
        if (timezones.isNotEmpty) 'tz': timezones.map((tz) => tz.toMap()).toList(),
        if (fragment != null) 'fr': {'_content': fragment},
      };
}
