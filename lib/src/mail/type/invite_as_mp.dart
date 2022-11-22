// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import '../../common/type/key_value_pair.dart';
import '../../common/type/key_value_pairs.dart';
import 'dl_subscription_notification.dart';
import 'email_info.dart';
import 'mail_custom_metadata.dart';
import 'message_common.dart';
import 'mp_invite_info.dart';
import 'part_info.dart';
import 'share_notification.dart';

/// Invite-As-MP
class InviteAsMP extends MessageCommon {
  /// Sub-part ID
  final String? id;

  /// If non-null, this message/rfc822 subpart of the specified Message is serialized
  final String? part;

  /// Sent date
  final int? sentDate;

  /// Email addresses
  final List<EmailInfo> emails;

  /// Subject
  final String? subject;

  /// Message ID header
  final String? messageIdHeader;

  /// Invite
  final MPInviteInfo? invite;

  /// Headers
  final List<KeyValuePair> headers;

  /// Mime part content elements
  final List<PartInfo> mpContentElems;

  /// Share notifications
  final List<ShareNotification> shrContentElems;

  /// Distribution list subscription notifications
  final List<DLSubscriptionNotification> dlSubsContentElems;

  const InviteAsMP({
    this.id,
    this.part,
    this.sentDate,
    this.emails = const [],
    this.subject,
    this.messageIdHeader,
    this.invite,
    this.headers = const [],
    this.mpContentElems = const [],
    this.shrContentElems = const [],
    this.dlSubsContentElems = const [],
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

  factory InviteAsMP.fromMap(Map<String, dynamic> data) => InviteAsMP(
      id: data['id'],
      part: data['part'],
      sentDate: int.tryParse(data['sd']?.toString() ?? ''),
      emails: (data['e'] is Iterable)
          ? (data['e'] as Iterable).map<EmailInfo>((e) => EmailInfo.fromMap(e)).toList(growable: false)
          : const [],
      subject: data['su'],
      messageIdHeader: data['mid'],
      invite: (data['inv'] is Map) ? MPInviteInfo.fromMap(data['inv']) : null,
      headers: KeyValuePairs.keyValuePairsFromMap(data),
      mpContentElems: (data['mp'] is Iterable)
          ? (data['mp'] as Iterable).map<PartInfo>((mp) => PartInfo.fromMap(mp)).toList(growable: false)
          : const [],
      shrContentElems: (data['shr'] is Iterable)
          ? (data['shr'] as Iterable)
              .map<ShareNotification>((shr) => ShareNotification.fromMap(shr))
              .toList(growable: false)
          : const [],
      dlSubsContentElems: (data['dlSubs'] is Iterable)
          ? (data['dlSubs'] as Iterable)
              .map<DLSubscriptionNotification>((dlSubs) => DLSubscriptionNotification.fromMap(dlSubs))
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
              .map<MailCustomMetadata>((meta) => MailCustomMetadata.fromMap(meta))
              .toList(growable: false)
          : const []);

  @override
  Map<String, dynamic> toMap() => {
        if (id != null) 'id': id,
        if (part != null) 'part': part,
        if (sentDate != null) 'sd': sentDate,
        if (emails.isNotEmpty) 'e': emails.map((e) => e.toMap()).toList(growable: false),
        if (subject != null) 'su': subject,
        if (messageIdHeader != null) 'mid': messageIdHeader,
        if (invite != null) 'inv': invite!.toMap(),
        if (headers.isNotEmpty) 'header': headers.map((header) => header.toMap()).toList(growable: false),
        if (mpContentElems.isNotEmpty) 'mp': mpContentElems.map((mp) => mp.toMap()).toList(growable: false),
        if (shrContentElems.isNotEmpty) 'shr': shrContentElems.map((shr) => shr.toMap()).toList(growable: false),
        if (dlSubsContentElems.isNotEmpty)
          'dlSubs': dlSubsContentElems.map((dlSubs) => dlSubs.toMap()).toList(growable: false),
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
