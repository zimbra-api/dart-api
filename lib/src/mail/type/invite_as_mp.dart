// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/key_value_pair.dart';
import 'package:zimbra_api/src/mail/type/part_info.dart';

import 'dl_subscription_notification.dart';
import 'email_info.dart';
import 'mail_custom_metadata.dart';
import 'message_common.dart';
import 'mp_invite_info.dart';
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

  InviteAsMP(
      {this.id,
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
      super.metadatas = const []});

  factory InviteAsMP.fromMap(Map<String, dynamic> data) => InviteAsMP(
      id: data['id'],
      part: data['part'],
      sentDate: data['sd'],
      emails: (data['e'] is Iterable)
          ? List.from((data['e'] as Iterable).map<EmailInfo>((e) => EmailInfo.fromMap(e)))
          : [],
      subject: data['su'],
      messageIdHeader: data['mid'],
      invite: (data['inv'] is Map) ? MPInviteInfo.fromMap(data['inv']) : null,
      headers: (data['header'] is Iterable)
          ? List.from((data['header'] as Iterable).map<KeyValuePair>((header) => KeyValuePair.fromMap(header)))
          : [],
      mpContentElems: (data['mp'] is Iterable)
          ? List.from((data['mp'] as Iterable).map<PartInfo>((mp) => PartInfo.fromMap(mp)))
          : [],
      shrContentElems: (data['shr'] is Iterable)
          ? List.from((data['shr'] as Iterable).map<ShareNotification>((shr) => ShareNotification.fromMap(shr)))
          : [],
      dlSubsContentElems: (data['dlSubs'] is Iterable)
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
        if (part != null) 'part': part,
        if (sentDate != null) 'sd': sentDate,
        if (emails.isNotEmpty) 'e': emails.map((e) => e.toMap()).toList(),
        if (subject != null) 'su': subject,
        if (messageIdHeader != null) 'mid': messageIdHeader,
        if (invite != null) 'inv': invite!.toMap(),
        if (headers.isNotEmpty) 'header': headers.map((header) => header.toMap()).toList(),
        if (mpContentElems.isNotEmpty) 'mp': mpContentElems.map((mp) => mp.toMap()).toList(),
        if (shrContentElems.isNotEmpty) 'shr': shrContentElems.map((shr) => shr.toMap()).toList(),
        if (dlSubsContentElems.isNotEmpty) 'dlSubs': dlSubsContentElems.map((dlSubs) => dlSubs.toMap()).toList(),
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
