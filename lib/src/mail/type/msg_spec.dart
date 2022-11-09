// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/enum/msg_content.dart';
import 'package:zimbra_api/src/common/type/attribute_name.dart';

/// Message specifications.
class MsgSpec {
  /// Message ID.
  /// Can contain a subpart identifier (e.g. "775-778") to return a message stored as a subpart of some other mail-item,
  /// specifically for Messages stored as part of Appointments
  final String? id;

  /// Supply a "part" and the retrieved data will be on the specified message/rfc822 subpart.
  /// If the part does not exist or is not a message/rfc822 part,
  /// mail.NO_SUCH_PART MailServiceException will be thrown
  final String? part;

  /// Set to return the raw message content rather than a parsed mime structure;
  /// (default is unset. If message is too big or not ASCII, a content servlet URL is returned)
  final bool? raw;

  /// Set to mark the message as read, unset to leave the read status unchanged.
  /// By default, the read status is left unchanged.
  final bool? markRead;

  /// Use {max-inlined-length} to limit the length of the text inlined into body <content>.
  /// Only applicable when <raw> is unset. Ignored when <raw> is set.
  /// (Default is unset, meaning no limit)
  final int? maxInlinedLength;

  /// If set, never inline raw <content> for messages, specify by <url> instead.
  /// Only applicable when <raw> is set. Ignored when <raw> is unset.
  /// (Default is unset - meaning inline content unless it is too big, in which case the <url> method will be used)
  final bool? useContentUrl;

  /// Set to return defanged HTML content by default. (default is unset.)
  final bool? wantHtml;

  /// Set to return IMAP UID. (default is unset.)
  final bool? wantImapUid;

  /// Set to return Modified Sequence. (default is unset.)
  final bool? wantModifiedSequence;

  /// Set to "neuter" <IMG> tags returned in HTML content; this involves
  /// switching the <src> attribute to <dfsrc> so that images don't display by default (default is set.)
  final bool? neuter;

  /// Recurrence ID in format YYYYMMDD[ThhmmssZ].
  /// Used only when making GetMsg call to open an instance of a recurring appointment.
  /// The value specified is the date/time data of the RECURRENCE-ID of the instance being requested.
  final String? recurIdZ;

  /// Set to return group info (isGroup and exp flags) on <e> elements in the response (default is unset.)
  final bool? needCanExpand;

  /// wantContent = "full" to get the complete message along with the quoted content
  /// wantContent = "original" to get the message without quoted content
  /// wantContent = "both" to get complete message as well as the message without quoted content
  /// By default wantContent = "full"
  /// Only applicable when <raw> is unset.
  /// Note: Quoted text identification is a best effort. It is not supported by any RFCs
  final MsgContent? wantContent;

  /// Requested headers. If <header>s are requested, any matching headers are
  /// inlined into the response (not available when raw is set)
  final List<AttributeName> headers;

  MsgSpec(
      {this.id,
      this.part,
      this.raw,
      this.markRead,
      this.maxInlinedLength,
      this.useContentUrl,
      this.wantHtml,
      this.wantImapUid,
      this.wantModifiedSequence,
      this.neuter,
      this.recurIdZ,
      this.needCanExpand,
      this.wantContent,
      this.headers = const []});

  factory MsgSpec.fromMap(Map<String, dynamic> data) => MsgSpec(
      id: data['id'],
      part: data['part'],
      raw: data['raw'],
      markRead: data['read'],
      maxInlinedLength: int.tryParse(data['max']?.toString() ?? ''),
      useContentUrl: data['useContentUrl'],
      wantHtml: data['html'],
      wantImapUid: data['wantImapUid'],
      wantModifiedSequence: data['wantModSeq'],
      neuter: data['neuter'],
      recurIdZ: data['ridZ'],
      needCanExpand: data['needExp'],
      wantContent: MsgContent.values.firstWhere(
        (wantContent) => wantContent.name == data['wantContent'],
        orElse: () => MsgContent.full,
      ),
      headers: (data['header'] is Iterable)
          ? List.from((data['header'] as Iterable).map<AttributeName>((header) => AttributeName.fromMap(header)))
          : []);

  Map<String, dynamic> toMap() => {
        if (id != null) 'id': id,
        if (part != null) 'part': part,
        if (raw != null) 'raw': raw,
        if (markRead != null) 'read': markRead,
        if (maxInlinedLength != null) 'max': maxInlinedLength,
        if (useContentUrl != null) 'useContentUrl': useContentUrl,
        if (wantHtml != null) 'html': wantHtml,
        if (wantImapUid != null) 'wantImapUid': wantImapUid,
        if (wantModifiedSequence != null) 'wantModSeq': wantModifiedSequence,
        if (neuter != null) 'neuter': neuter,
        if (recurIdZ != null) 'ridZ': recurIdZ,
        if (needCanExpand != null) 'needExp': needCanExpand,
        if (wantContent != null) 'wantContent': wantContent!.name,
        if (headers.isNotEmpty) 'header': headers.map((header) => header.toMap()).toList(),
      };
}
