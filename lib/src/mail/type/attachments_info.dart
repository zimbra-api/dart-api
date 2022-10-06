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
      {this.mpAttachments = const <MimePartAttachSpec>[],
      this.msgAttachments = const <MsgAttachSpec>[],
      this.cnAttachments = const <ContactAttachSpec>[],
      this.docAttachments = const <DocAttachSpec>[]});

  factory AttachmentsInfo.fromJson(Map<String, dynamic> json) {
    final info = AttachmentsInfo(json['aid'] ?? '');

    if (json['mp'] != null && json['mp'] is Iterable) {
      final mpAttachments = json['mp'] as Iterable;
      for (final mp in mpAttachments) {
        info.mpAttachments.add(MimePartAttachSpec.fromJson(mp));
      }
    }

    if (json['m'] != null && json['m'] is Iterable) {
      final msgAttachments = json['m'] as Iterable;
      for (final imap in msgAttachments) {
        info.msgAttachments.add(MsgAttachSpec.fromJson(imap));
      }
    }

    if (json['cn'] != null && json['cn'] is Iterable) {
      final cnAttachments = json['cn'] as Iterable;
      for (final imap in cnAttachments) {
        info.cnAttachments.add(ContactAttachSpec.fromJson(imap));
      }
    }

    if (json['doc'] != null && json['doc'] is Iterable) {
      final imapDataSources = json['doc'] as Iterable;
      for (final doc in imapDataSources) {
        info.docAttachments.add(DocAttachSpec.fromJson(doc));
      }
    }
    return info;
  }

  Map<String, dynamic> toJson() => {
        'aid': attachmentId,
        if (mpAttachments.isNotEmpty) 'mp': mpAttachments.map((mp) => mp.toJson()),
        if (msgAttachments.isNotEmpty) 'm': msgAttachments.map((m) => m.toJson()),
        if (cnAttachments.isNotEmpty) 'cn': cnAttachments.map((cn) => cn.toJson()),
        if (docAttachments.isNotEmpty) 'doc': docAttachments.map((doc) => doc.toJson()),
      };
}
