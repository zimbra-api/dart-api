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

  factory MessageInfo.fromJson(Map<String, dynamic> json) => MessageInfo(
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
      inReplyTo: json['irt'],
      invite: json['inv'] is Map ? InviteInfo.fromJson(json['inv']) : null,
      headers: (json['header'] is Iterable)
          ? List.from((json['header'] as Iterable).map<KeyValuePair>((header) => KeyValuePair.fromJson(header)))
          : [],
      partInfos: (json['mp'] is Iterable)
          ? List.from((json['mp'] as Iterable).map<PartInfo>((mp) => PartInfo.fromJson(mp)))
          : [],
      shareNotifications: (json['shr'] is Iterable)
          ? List.from((json['shr'] as Iterable).map<ShareNotification>((shr) => ShareNotification.fromJson(shr)))
          : [],
      dlSubsNotifications: (json['dlSubs'] is Iterable)
          ? List.from((json['dlSubs'] as Iterable)
              .map<DLSubscriptionNotification>((dlSubs) => DLSubscriptionNotification.fromJson(dlSubs)))
          : [],
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
        if (inReplyTo != null) 'irt': inReplyTo,
        if (invite != null) 'inv': invite!.toJson(),
        if (headers.isNotEmpty) 'header': headers.map((header) => header.toJson()).toList(),
        if (partInfos.isNotEmpty) 'mp': partInfos.map((mp) => mp.toJson()).toList(),
        if (shareNotifications.isNotEmpty) 'shr': shareNotifications.map((shr) => shr.toJson()).toList(),
        if (dlSubsNotifications.isNotEmpty) 'dlSubs': dlSubsNotifications.map((dlSubs) => dlSubs.toJson()).toList(),
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
