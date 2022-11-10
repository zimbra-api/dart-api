// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'attachments_info.dart';

class MimePartInfo {
  /// Content type
  final String? contentType;

  /// Content
  final String? content;

  /// Content ID
  final String? contentId;

  /// Attachments
  final AttachmentsInfo? attachments;

  /// MIME Parts
  final List<MimePartInfo> mimeParts;

  MimePartInfo({this.contentType, this.content, this.contentId, this.attachments, this.mimeParts = const []});

  factory MimePartInfo.fromMap(Map<String, dynamic> data) => MimePartInfo(
      contentType: data['ct'],
      content: data['content'],
      contentId: data['ci'],
      attachments: data['attach'] is Map ? AttachmentsInfo.fromMap(data['attach']) : null,
      mimeParts: (data['mp'] is Iterable)
          ? (data['mp'] as Iterable).map<MimePartInfo>((mp) => MimePartInfo.fromMap(mp)).toList(growable: false)
          : const []);

  Map<String, dynamic> toMap() => {
        if (contentType != null) 'ct': contentType,
        if (content != null) 'content': content,
        if (contentId != null) 'ci': contentId,
        if (attachments != null) 'attach': attachments!.toMap(),
        if (mimeParts.isNotEmpty) 'mp': mimeParts.map((mp) => mp.toMap()).toList(growable: false),
      };
}
