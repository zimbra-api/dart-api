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

  Msg({
    this.attachmentId,
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
    this.fragment,
  });

  factory Msg.fromJson(Map<String, dynamic> json) {
    final replyType = ReplyType.values.firstWhere(
      (item) => item.name == json['rt'],
      orElse: () => ReplyType.replied,
    );

    final headers = <Header>[];
    if (json['header'] != null && json['header'] is Iterable) {
      final elements = json['header'] as Iterable;
      for (final header in elements) {
        headers.add(Header.fromJson(header));
      }
    }

    final emailAddresses = <EmailAddrInfo>[];
    if (json['e'] != null && json['e'] is Iterable) {
      final elements = json['e'] as Iterable;
      for (final e in elements) {
        emailAddresses.add(EmailAddrInfo.fromJson(e));
      }
    }

    final timezones = <CalTZInfo>[];
    if (json['tz'] != null && json['tz'] is Iterable) {
      final elements = json['tz'] as Iterable;
      for (final tz in elements) {
        timezones.add(CalTZInfo.fromJson(tz));
      }
    }

    return Msg(
      attachmentId: json['aid'],
      origId: json['origid'],
      replyType: replyType,
      identityId: json['idnt'],
      subject: json['su'],
      headers: headers,
      inReplyTo: json['irt'],
      folderId: json['l'],
      flags: json['f'],
      content: json['content'] != null ? json['content']['_content'] : null,
      mimePart: json['mp'] != null ? MimePartInfo.fromJson(json['mp']) : null,
      attachments: json['attach'] != null ? AttachmentsInfo.fromJson(json['attach']) : null,
      invite: json['inv'] != null ? InvitationInfo.fromJson(json['inv']) : null,
      emailAddresses: emailAddresses,
      timezones: timezones,
      fragment: json['fr'] != null ? json['fr']['_content'] : null,
    );
  }

  Map<String, dynamic> toJson() => {
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
