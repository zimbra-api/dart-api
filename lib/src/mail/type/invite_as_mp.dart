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

  factory InviteAsMP.fromJson(Map<String, dynamic> json) => InviteAsMP(
        id: json['id'],
        part: json['part'],
        sentDate: json['sd'],
        emails: (json['e'] is Iterable)
            ? List.from((json['e'] as Iterable).map<EmailInfo>((e) => EmailInfo.fromJson(e)))
            : [],
        subject: json['su']?['_content'],
        messageIdHeader: json['mid']?['_content'],
        invite: (json['inv'] is Map) ? MPInviteInfo.fromJson(json['inv']) : null,
        headers: (json['header'] is Iterable)
            ? List.from((json['header'] as Iterable).map<KeyValuePair>((header) => KeyValuePair.fromJson(header)))
            : [],
        mpContentElems: (json['mp'] is Iterable)
            ? List.from((json['mp'] as Iterable).map<PartInfo>((mp) => PartInfo.fromJson(mp)))
            : [],
        shrContentElems: (json['shr'] is Iterable)
            ? List.from((json['shr'] as Iterable).map<ShareNotification>((shr) => ShareNotification.fromJson(shr)))
            : [],
        dlSubsContentElems: (json['dlSubs'] is Iterable)
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
            : [],
      );

  @override
  Map<String, dynamic> toJson() => {
        if (id != null) 'id': id,
        if (part != null) 'part': part,
        if (sentDate != null) 'sd': sentDate,
        if (emails.isNotEmpty) 'e': emails.map((e) => e.toJson()).toList(),
        if (subject != null) 'su': {'_content': subject},
        if (messageIdHeader != null) 'mid': {'_content': messageIdHeader},
        if (invite != null) 'inv': invite!.toJson(),
        if (headers.isNotEmpty) 'header': headers.map((header) => header.toJson()).toList(),
        if (mpContentElems.isNotEmpty) 'mp': mpContentElems.map((mp) => mp.toJson()).toList(),
        if (shrContentElems.isNotEmpty) 'shr': shrContentElems.map((shr) => shr.toJson()).toList(),
        if (dlSubsContentElems.isNotEmpty) 'dlSubs': dlSubsContentElems.map((dlSubs) => dlSubs.toJson()).toList(),
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
