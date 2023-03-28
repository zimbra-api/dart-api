// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import '../../common/enum/reply_type.dart';
import '../../common/type/key_value_pairs.dart';
import 'dl_subscription_notification.dart';
import 'email_info.dart';
import 'invite_info.dart';
import 'mail_custom_metadata.dart';
import 'message_info.dart';
import 'part.dart';
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

  const MessageHitInfo({
    this.sortField,
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
    super.metadatas = const [],
  });

  factory MessageHitInfo.fromMap(Map<String, dynamic> data) => MessageHitInfo(
        sortField: data['sf'],
        contentMatched: data['cm'],
        messagePartHits: (data['hp'] is Iterable)
            ? (data['hp'] as Iterable)
                .map<Part>(
                  (hp) => Part.fromMap(hp),
                )
                .toList(growable: false)
            : const [],
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
        draftAutoSendTime: int.tryParse(
          data['autoSendTime']?.toString() ?? '',
        ),
        sentDate: int.tryParse(data['sd']?.toString() ?? ''),
        resentDate: int.tryParse(data['rd']?.toString() ?? ''),
        part: data['part'],
        fragment: data['fr'],
        emails: (data['e'] is Iterable)
            ? (data['e'] as Iterable)
                .map<EmailInfo>(
                  (e) => EmailInfo.fromMap(e),
                )
                .toList(growable: false)
            : const [],
        subject: data['su'],
        messageIdHeader: data['mid'],
        inReplyTo: data['irt'],
        invite: data['inv'] is Map ? InviteInfo.fromMap(data['inv']) : null,
        headers: KeyValuePairs.keyValuePairsFromMap(data),
        partInfos: (data['mp'] is Iterable)
            ? (data['mp'] as Iterable)
                .map<PartInfo>(
                  (mp) => PartInfo.fromMap(mp),
                )
                .toList(growable: false)
            : const [],
        shareNotifications: (data['shr'] is Iterable)
            ? (data['shr'] as Iterable)
                .map<ShareNotification>(
                  (shr) => ShareNotification.fromMap(shr),
                )
                .toList(growable: false)
            : const [],
        dlSubsNotifications: (data['dlSubs'] is Iterable)
            ? (data['dlSubs'] as Iterable)
                .map<DLSubscriptionNotification>(
                  (dlSubs) => DLSubscriptionNotification.fromMap(dlSubs),
                )
                .toList(growable: false)
            : const [],
        size: int.tryParse(data['s']?.toString() ?? ''),
        date: int.tryParse(data['d']?.toString() ?? ''),
        folder: data['l'],
        conversationId: data['cid'],
        flags: data['f'],
        tags: data['t'],
        tagNames: data['tn'],
        revision: int.tryParse(data['rev']?.toString() ?? ''),
        changeDate: int.tryParse(data['md']?.toString() ?? ''),
        modifiedSequence: int.tryParse(data['ms']?.toString() ?? ''),
        metadatas: (data['meta'] is Iterable)
            ? (data['meta'] as Iterable)
                .map<MailCustomMetadata>(
                  (meta) => MailCustomMetadata.fromMap(meta),
                )
                .toList(growable: false)
            : [],
      );

  @override
  Map<String, dynamic> toMap() => {
        if (sortField != null) 'sf': sortField,
        if (contentMatched != null) 'cm': contentMatched,
        if (messagePartHits.isNotEmpty)
          'hp': messagePartHits
              .map(
                (hp) => hp.toMap(),
              )
              .toList(growable: false),
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
        if (emails.isNotEmpty)
          'e': emails
              .map(
                (e) => e.toMap(),
              )
              .toList(growable: false),
        if (subject != null) 'su': subject,
        if (messageIdHeader != null) 'mid': messageIdHeader,
        if (inReplyTo != null) 'irt': inReplyTo,
        if (invite != null) 'inv': invite!.toMap(),
        if (headers.isNotEmpty)
          'header': headers
              .map(
                (header) => header.toMap(),
              )
              .toList(growable: false),
        if (partInfos.isNotEmpty)
          'mp': partInfos
              .map(
                (mp) => mp.toMap(),
              )
              .toList(growable: false),
        if (shareNotifications.isNotEmpty)
          'shr': shareNotifications
              .map(
                (shr) => shr.toMap(),
              )
              .toList(growable: false),
        if (dlSubsNotifications.isNotEmpty)
          'dlSubs': dlSubsNotifications
              .map(
                (dlSubs) => dlSubs.toMap(),
              )
              .toList(growable: false),
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
        if (metadatas.isNotEmpty)
          'meta': metadatas
              .map(
                (meta) => meta.toMap(),
              )
              .toList(growable: false),
      };
}
