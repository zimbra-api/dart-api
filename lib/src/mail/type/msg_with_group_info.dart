// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import '../../common/enum/reply_type.dart';
import '../../common/type/key_value_pair.dart';
import '../../common/type/key_value_pairs.dart';
import '../../common/type/url_and_value.dart';
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

  const MsgWithGroupInfo({
    this.id,
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
    super.metadatas = const [],
  });

  factory MsgWithGroupInfo.fromMap(Map<String, dynamic> data) => MsgWithGroupInfo(
      id: data['id'],
      imapUid: int.tryParse(data['i4uid']?.toString() ?? ''),
      calendarIntendedFor: data['cif'],
      origId: data['origid'],
      draftReplyType: ReplyType.values.firstWhere(
        (rt) => rt.name == data['rt'],
        orElse: () => ReplyType.replied,
      ),
      identityId: data['idnt'],
      draftAccountId: data['forAcct'],
      draftAutoSendTime: int.tryParse(data['autoSendTime']?.toString() ?? ''),
      sentDate: int.tryParse(data['sd']?.toString() ?? ''),
      resentDate: int.tryParse(data['rd']?.toString() ?? ''),
      part: data['part'],
      fragment: data['fr'],
      emails: (data['e'] is Iterable)
          ? (data['e'] as Iterable).map<EmailInfo>((e) => EmailInfo.fromMap(e)).toList(growable: false)
          : const [],
      subject: data['su'],
      messageIdHeader: data['mid'],
      inReplyTo: data['irt'],
      invite: data['inv'] is Map ? InviteWithGroupInfo.fromMap(data['inv']) : null,
      headers: KeyValuePairs.keyValuePairsFromMap(data),
      mimePart: data['mp'] is Map ? MimePartInfo.fromMap(data['mp']) : null,
      shrNotification: data['shr'] is Map ? ShareNotification.fromMap(data['shr']) : null,
      dlSubsNotification: data['dlSubs'] is Map ? DLSubscriptionNotification.fromMap(data['dlSubs']) : null,
      content: data['content'] is Map ? UrlAndValue.fromMap(data['content']) : null,
      size: int.tryParse(data['s']?.toString() ?? ''),
      date: int.tryParse(data['d']?.toString() ?? ''),
      folder: data['l'],
      conversationId: data['cid'],
      flags: data['f'],
      tags: data['t'],
      tagNames: data['tn'],
      revision: data['rev'],
      changeDate: int.tryParse(data['md']?.toString() ?? ''),
      modifiedSequence: int.tryParse(data['ms']?.toString() ?? ''),
      metadatas: (data['meta'] is Iterable)
          ? (data['meta'] as Iterable)
              .map<MailCustomMetadata>((meta) => MailCustomMetadata.fromMap(meta))
              .toList(growable: false)
          : const []);

  @override
  Map<String, dynamic> toMap() => {
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
        if (fragment != null) 'fr': fragment,
        if (emails.isNotEmpty) 'e': emails.map((e) => e.toMap()).toList(growable: false),
        if (subject != null) 'su': subject,
        if (messageIdHeader != null) 'mid': messageIdHeader,
        if (inReplyTo != null) 'irt': inReplyTo,
        if (invite != null) 'inv': invite!.toMap(),
        if (headers.isNotEmpty) 'header': headers.map((header) => header.toMap()).toList(growable: false),
        if (mimePart != null) 'mp': mimePart!.toMap(),
        if (shrNotification != null) 'shr': shrNotification!.toMap(),
        if (dlSubsNotification != null) 'dlSubs': dlSubsNotification!.toMap(),
        if (content != null) 'content': content!.toMap(),
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
        if (metadatas.isNotEmpty) 'meta': metadatas.map((meta) => meta.toMap()).toList(growable: false),
      };
}
