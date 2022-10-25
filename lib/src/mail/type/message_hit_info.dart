// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/enum/reply_type.dart';
import 'package:zimbra_api/src/common/type/key_value_pair.dart';
import 'package:zimbra_api/src/mail/type/part.dart';

import 'dl_subscription_notification.dart';
import 'email_info.dart';
import 'invite_info.dart';
import 'mail_custom_metadata.dart';
import 'message_info.dart';
import 'part_info.dart';
import 'share_notification.dart';

/// Message search result information containing a list of messages
class MessageHitInfo extends MessageInfo {
  /// Sort field value
  final String? sortField;

  /// If the message matched the specified query string
  final bool? contentMatched;

  /// Hit Parts -- indicators that the named parts matched the search string
  final List<Part> messagePartHits;

  MessageHitInfo(
      {this.sortField,
      this.contentMatched,
      this.messagePartHits = const [],
      super.id,
      super.imapUid,
      super.calendarIntendedFor,
      super.origId,
      super.draftReplyType,
      super.identityId,
      super.draftAccountId,
      super.draftAutoSendTime,
      super.sentDate,
      super.resentDate,
      super.part,
      super.fragment,
      super.emails = const [],
      super.subject,
      super.messageIdHeader,
      super.inReplyTo,
      super.invite,
      super.headers = const [],
      super.partInfos = const [],
      super.shareNotifications = const [],
      super.dlSubsNotifications = const [],
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

  factory MessageHitInfo.fromJson(Map<String, dynamic> json) => MessageHitInfo(
      sortField: json['sf'],
      contentMatched: json['cm'],
      messagePartHits:
          (json['hp'] is Iterable) ? List.from((json['hp'] as Iterable).map<Part>((hp) => Part.fromJson(hp))) : [],
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
        if (sortField != null) 'sf': sortField,
        if (contentMatched != null) 'cm': contentMatched,
        if (messagePartHits.isNotEmpty) 'hp': messagePartHits.map((hp) => hp.toJson()).toList(),
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
