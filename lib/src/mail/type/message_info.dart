// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/enum/reply_type.dart';
import 'package:zimbra_api/src/common/type/key_value_pair.dart';

import 'dl_subscription_notification.dart';
import 'email_info.dart';
import 'invite_info.dart';
import 'mail_custom_metadata.dart';
import 'message_common.dart';
import 'part_info.dart';
import 'share_notification.dart';

class MessageInfo extends MessageCommon {
  /// Message ID
  final String? id;

  /// IMAP UID
  final int? imapUid;

  /// X-Zimbra-Calendar-Intended-For header
  final String? calendarIntendedFor;

  /// Message id of the message being replied to/forwarded (outbound messages only)
  final String? origId;

  /// Reply type - r|w: (r)eplied or for(w)arded.
  final ReplyType? draftReplyType;

  /// If set, this specifies the identity being used to compose the message
  final String? identityId;

  /// Draft account ID
  final String? draftAccountId;

  /// Can optionally set this to specify the time at which the draft should be
  /// automatically sent by the server
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

  /// Subject
  final String? subject;

  /// Message ID
  final String? messageIdHeader;

  /// Message-ID header for message being replied to
  final String? inReplyTo;

  /// Parsed out iCalendar invite
  final InviteInfo? invite;

  /// Headers
  final List<KeyValuePair> headers;

  /// Part infomations
  final List<PartInfo> partInfos;

  /// Share notifications
  final List<ShareNotification> shareNotifications;

  /// DL subscription notifications
  final List<DLSubscriptionNotification> dlSubsNotifications;

  MessageInfo(
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
      this.partInfos = const [],
      this.shareNotifications = const [],
      this.dlSubsNotifications = const [],
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

  factory MessageInfo.fromMap(Map<String, dynamic> data) => MessageInfo(
      id: data['id'],
      imapUid: data['i4uid'],
      calendarIntendedFor: data['cif'],
      origId: data['origid'],
      draftReplyType: ReplyType.values.firstWhere(
        (rt) => rt.name == data['rt'],
        orElse: () => ReplyType.replied,
      ),
      identityId: data['idnt'],
      draftAccountId: data['forAcct'],
      draftAutoSendTime: data['autoSendTime'],
      sentDate: data['sd'],
      resentDate: data['rd'],
      part: data['part'],
      fragment: data['fr'],
      emails: (data['e'] is Iterable)
          ? List.from((data['e'] as Iterable).map<EmailInfo>((e) => EmailInfo.fromMap(e)))
          : [],
      subject: data['su'],
      messageIdHeader: data['mid'],
      inReplyTo: data['irt'],
      invite: data['inv'] is Map ? InviteInfo.fromMap(data['inv']) : null,
      headers: (data['header'] is Iterable)
          ? List.from((data['header'] as Iterable).map<KeyValuePair>((header) => KeyValuePair.fromMap(header)))
          : [],
      partInfos: (data['mp'] is Iterable)
          ? List.from((data['mp'] as Iterable).map<PartInfo>((mp) => PartInfo.fromMap(mp)))
          : [],
      shareNotifications: (data['shr'] is Iterable)
          ? List.from((data['shr'] as Iterable).map<ShareNotification>((shr) => ShareNotification.fromMap(shr)))
          : [],
      dlSubsNotifications: (data['dlSubs'] is Iterable)
          ? List.from((data['dlSubs'] as Iterable)
              .map<DLSubscriptionNotification>((dlSubs) => DLSubscriptionNotification.fromMap(dlSubs)))
          : [],
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
          : []);

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
        if (emails.isNotEmpty) 'e': emails.map((e) => e.toMap()).toList(),
        if (subject != null) 'su': subject,
        if (messageIdHeader != null) 'mid': messageIdHeader,
        if (inReplyTo != null) 'irt': inReplyTo,
        if (invite != null) 'inv': invite!.toMap(),
        if (headers.isNotEmpty) 'header': headers.map((header) => header.toMap()).toList(),
        if (partInfos.isNotEmpty) 'mp': partInfos.map((mp) => mp.toMap()).toList(),
        if (shareNotifications.isNotEmpty) 'shr': shareNotifications.map((shr) => shr.toMap()).toList(),
        if (dlSubsNotifications.isNotEmpty) 'dlSubs': dlSubsNotifications.map((dlSubs) => dlSubs.toMap()).toList(),
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
        if (metadatas.isNotEmpty) 'meta': metadatas.map((meta) => meta.toMap()).toList(),
      };
}
