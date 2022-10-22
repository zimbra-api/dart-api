// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/enum/reply_type.dart';
import 'package:zimbra_api/src/common/type/key_value_pair.dart';
import 'package:zimbra_api/src/common/type/url_and_value.dart';

import 'dl_subscription_notification.dart';
import 'email_info.dart';
import 'invite_with_group_info.dart';
import 'mail_custom_metadata.dart';
import 'message_common.dart';
import 'mime_part_info.dart';
import 'share_notification.dart';

/// Message with group information
class MsgWithGroupInfo extends MessageCommon {
  /// Message ID
  final String? id;

  /// IMAP UID
  final int? imapUid;

  /// X-Zimbra-Calendar-Intended-For header
  final String? calendarIntendedFor;

  /// Message id of the message being replied to/forwarded (outbound messages only)
  final String? origId;

  /// Reply type - r|w
  final ReplyType? draftReplyType;

  /// If set, this specifies the identity being used to compose the message
  final String? identityId;

  /// Draft account ID
  final String? draftAccountId;

  /// Can optionally set this to specify the time at which the draft should be automatically sent by the server
  final int? draftAutoSendTime;

  /// Date header
  final int? sentDate;

  /// Resent date
  final int? resentDate;

  /// Part
  final String? part;

  /// First few bytes of the message (probably between 40 and 100 bytes)
  final String? fragment;

  /// Email addresses
  final List<EmailInfo> emails;

  final String? subject;

  /// Message ID
  final String? messageIdHeader;

  /// Message-ID header for message being replied to
  final String? inReplyTo;

  /// Invite information
  final InviteWithGroupInfo? invite;

  /// Headers
  final List<KeyValuePair> headers;

  /// Mime part information
  final MimePartInfo? mimePart;

  /// Share Notification information
  final ShareNotification? shrNotification;

  /// DL Subscription Notification information
  final DLSubscriptionNotification? dlSubsNotification;

  /// Content
  final UrlAndValue? content;

  MsgWithGroupInfo(
      {this.id,
      this.imapUid,
      this.calendarIntendedFor,
      this.origId,
      this.draftReplyType,
      this.identityId,
      this.draftAccountId,
      this.draftAutoSendTime,
      this.sentDate,
      this.resentDate,
      this.part,
      this.fragment,
      this.emails = const [],
      this.subject,
      this.messageIdHeader,
      this.inReplyTo,
      this.invite,
      this.headers = const [],
      this.mimePart,
      this.shrNotification,
      this.dlSubsNotification,
      this.content,
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

  factory MsgWithGroupInfo.fromJson(Map<String, dynamic> json) => MsgWithGroupInfo(
      id: json['id'],
      imapUid: json['i4uid'],
      calendarIntendedFor: json['cif'],
      origId: json['origid'],
      draftReplyType: ReplyType.values.firstWhere(
        (rt) => rt.name == json['rt'],
        orElse: () => ReplyType.replied,
      ),
      identityId: json['idnt'],
      draftAccountId: json['forAcct'],
      draftAutoSendTime: json['autoSendTime'],
      sentDate: json['sd'],
      resentDate: json['rd'],
      part: json['part'],
      fragment: json['fr']?['_content'],
      emails: (json['e'] is Iterable)
          ? List.from((json['e'] as Iterable).map<EmailInfo>((e) => EmailInfo.fromJson(e)))
          : [],
      subject: json['su']?['_content'],
      messageIdHeader: json['mid']?['_content'],
      inReplyTo: json['irt']?['_content'],
      invite: json['inv'] is Map ? InviteWithGroupInfo.fromJson(json['inv']) : null,
      headers: (json['header'] is Iterable)
          ? List.from((json['header'] as Iterable).map<KeyValuePair>((header) => KeyValuePair.fromJson(header)))
          : [],
      mimePart: json['mp'] is Map ? MimePartInfo.fromJson(json['mp']) : null,
      shrNotification: json['shr'] is Map ? ShareNotification.fromJson(json['shr']) : null,
      dlSubsNotification: json['dlSubs'] is Map ? DLSubscriptionNotification.fromJson(json['dlSubs']) : null,
      content: json['content'] is Map ? UrlAndValue.fromJson(json['content']) : null,
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
          : []);

  @override
  Map<String, dynamic> toJson() => {
        if (id != null) 'id': id,
        if (imapUid != null) 'i4uid': imapUid,
        if (calendarIntendedFor != null) 'cif': calendarIntendedFor,
        if (origId != null) 'origid': origId,
        if (draftReplyType != null) 'rt': draftReplyType!.name,
        if (identityId != null) 'idnt': identityId,
        if (draftAccountId != null) 'forAcct': draftAccountId,
        if (draftAutoSendTime != null) 'autoSendTime': draftAutoSendTime,
        if (sentDate != null) 'sd': sentDate,
        if (resentDate != null) 'rd': resentDate,
        if (part != null) 'part': part,
        if (fragment != null) 'fr': {'_content': fragment},
        if (emails.isNotEmpty) 'e': emails.map((e) => e.toJson()).toList(),
        if (subject != null) 'su': {'_content': subject},
        if (messageIdHeader != null) 'mid': {'_content': messageIdHeader},
        if (inReplyTo != null) 'irt': {'_content': inReplyTo},
        if (invite != null) 'inv': invite!.toJson(),
        if (headers.isNotEmpty) 'header': headers.map((header) => header.toJson()).toList(),
        if (mimePart != null) 'mp': mimePart!.toJson(),
        if (shrNotification != null) 'shr': shrNotification!.toJson(),
        if (dlSubsNotification != null) 'dlSubs': dlSubsNotification!.toJson(),
        if (content != null) 'content': content!.toJson(),
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
