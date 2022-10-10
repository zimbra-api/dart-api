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

  factory AttachmentsInfo.fromJson(Map<String, dynamic> json) {
    final mpAttachments = <MimePartAttachSpec>[];
    if (json['mp'] != null && json['mp'] is Map<String, dynamic>) {
      final elements = json['mp'] as Iterable;
      for (final mp in elements) {
        mpAttachments.add(MimePartAttachSpec.fromJson(mp));
      }
    }

    final msgAttachments = <MsgAttachSpec>[];
    if (json['m'] != null && json['m'] is Map<String, dynamic>) {
      final elements = json['m'] as Iterable;
      for (final imap in elements) {
        msgAttachments.add(MsgAttachSpec.fromJson(imap));
      }
    }

    final cnAttachments = <ContactAttachSpec>[];
    if (json['cn'] != null && json['cn'] is Map<String, dynamic>) {
      final elements = json['cn'] as Iterable;
      for (final imap in elements) {
        cnAttachments.add(ContactAttachSpec.fromJson(imap));
      }
    }

    final docAttachments = <DocAttachSpec>[];
    if (json['doc'] != null && json['doc'] is Map<String, dynamic>) {
      final elements = json['doc'] as Iterable;
      for (final doc in elements) {
        docAttachments.add(DocAttachSpec.fromJson(doc));
      }
    }

    return AttachmentsInfo(json['aid'] ?? '',
        mpAttachments: mpAttachments,
        msgAttachments: msgAttachments,
        cnAttachments: cnAttachments,
        docAttachments: docAttachments);
  }

  Map<String, dynamic> toJson() => {
        'aid': attachmentId,
        if (mpAttachments.isNotEmpty) 'mp': mpAttachments.map((mp) => mp.toJson()).toList(),
        if (msgAttachments.isNotEmpty) 'm': msgAttachments.map((m) => m.toJson()).toList(),
        if (cnAttachments.isNotEmpty) 'cn': cnAttachments.map((cn) => cn.toJson()).toList(),
        if (docAttachments.isNotEmpty) 'doc': docAttachments.map((doc) => doc.toJson()).toList(),
      };
}
