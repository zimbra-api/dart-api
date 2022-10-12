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

  factory AttachmentsInfo.fromJson(Map<String, dynamic> json) => AttachmentsInfo(
        json['aid'] ?? '',
        mpAttachments: (json['mp'] is Iterable)
            ? List.from((json['mp'] as Iterable).map<MimePartAttachSpec>((mp) => MimePartAttachSpec.fromJson(mp)))
            : [],
        msgAttachments: (json['m'] is Iterable)
            ? List.from((json['m'] as Iterable).map<MsgAttachSpec>((m) => MsgAttachSpec.fromJson(m)))
            : [],
        cnAttachments: (json['cn'] is Iterable)
            ? List.from((json['cn'] as Iterable).map<ContactAttachSpec>((cn) => ContactAttachSpec.fromJson(cn)))
            : [],
        docAttachments: (json['doc'] is Iterable)
            ? List.from((json['doc'] as Iterable).map<DocAttachSpec>((doc) => DocAttachSpec.fromJson(doc)))
            : [],
      );

  Map<String, dynamic> toJson() => {
        'aid': attachmentId,
        if (mpAttachments.isNotEmpty) 'mp': mpAttachments.map((mp) => mp.toJson()).toList(),
        if (msgAttachments.isNotEmpty) 'm': msgAttachments.map((m) => m.toJson()).toList(),
        if (cnAttachments.isNotEmpty) 'cn': cnAttachments.map((cn) => cn.toJson()).toList(),
        if (docAttachments.isNotEmpty) 'doc': docAttachments.map((doc) => doc.toJson()).toList(),
      };
}
