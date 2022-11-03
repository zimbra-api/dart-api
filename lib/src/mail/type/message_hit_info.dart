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

  factory MessageHitInfo.fromMap(Map<String, dynamic> data) => MessageHitInfo(
      sortField: data['sf'],
      contentMatched: data['cm'],
      messagePartHits:
          (data['hp'] is Iterable) ? List.from((data['hp'] as Iterable).map<Part>((hp) => Part.fromMap(hp))) : [],
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
      fragment: data['fr']?['_content'],
      emails: (data['e'] is Iterable)
          ? List.from((data['e'] as Iterable).map<EmailInfo>((e) => EmailInfo.fromMap(e)))
          : [],
      subject: data['su']?['_content'],
      messageIdHeader: data['mid']?['_content'],
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
        if (sortField != null) 'sf': sortField,
        if (contentMatched != null) 'cm': contentMatched,
        if (messagePartHits.isNotEmpty) 'hp': messagePartHits.map((hp) => hp.toMap()).toList(),
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
        if (emails.isNotEmpty) 'e': emails.map((e) => e.toMap()).toList(),
        if (subject != null) 'su': {'_content': subject},
        if (messageIdHeader != null) 'mid': {'_content': messageIdHeader},
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
