// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'contact_attach_spec.dart';
import 'doc_attach_spec.dart';
import 'mime_part_attach_spec.dart';
import 'msg_attach_spec.dart';

class AttachmentsInfo {
  /// Attachment upload ID
  final String attachmentId;

  /// Mime part attachment details
  final List<MimePartAttachSpec> mpAttachments;

  /// Msg attachment details
  final List<MsgAttachSpec> msgAttachments;

  /// Contact attachment details
  final List<ContactAttachSpec> cnAttachments;

  /// Doc attachment details
  final List<DocAttachSpec> docAttachments;

  AttachmentsInfo(this.attachmentId,
      {this.mpAttachments = const [],
      this.msgAttachments = const [],
      this.cnAttachments = const [],
      this.docAttachments = const []});

  factory AttachmentsInfo.fromMap(Map<String, dynamic> data) => AttachmentsInfo(
        data['aid'] ?? '',
        mpAttachments: (data['mp'] is Iterable)
            ? List.from((data['mp'] as Iterable).map<MimePartAttachSpec>((mp) => MimePartAttachSpec.fromMap(mp)))
            : [],
        msgAttachments: (data['m'] is Iterable)
            ? List.from((data['m'] as Iterable).map<MsgAttachSpec>((m) => MsgAttachSpec.fromMap(m)))
            : [],
        cnAttachments: (data['cn'] is Iterable)
            ? List.from((data['cn'] as Iterable).map<ContactAttachSpec>((cn) => ContactAttachSpec.fromMap(cn)))
            : [],
        docAttachments: (data['doc'] is Iterable)
            ? List.from((data['doc'] as Iterable).map<DocAttachSpec>((doc) => DocAttachSpec.fromMap(doc)))
            : [],
      );

  Map<String, dynamic> toMap() => {
        'aid': attachmentId,
        if (mpAttachments.isNotEmpty) 'mp': mpAttachments.map((mp) => mp.toMap()).toList(),
        if (msgAttachments.isNotEmpty) 'm': msgAttachments.map((m) => m.toMap()).toList(),
        if (cnAttachments.isNotEmpty) 'cn': cnAttachments.map((cn) => cn.toMap()).toList(),
        if (docAttachments.isNotEmpty) 'doc': docAttachments.map((doc) => doc.toMap()).toList(),
      };
}
