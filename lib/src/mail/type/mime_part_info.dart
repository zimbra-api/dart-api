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

  factory MimePartInfo.fromJson(Map<String, dynamic> json) => MimePartInfo(
      contentType: json['ct'],
      content: json['content'],
      contentId: json['ci'],
      attachments: json['attach'] is Map ? AttachmentsInfo.fromJson(json['attach']) : null,
      mimeParts: (json['mp'] is Iterable)
          ? List.from((json['mp'] as Iterable).map<MimePartInfo>((mp) => MimePartInfo.fromJson(mp)))
          : []);

  Map<String, dynamic> toJson() => {
        if (contentType != null) 'ct': contentType,
        if (content != null) 'content': content,
        if (contentId != null) 'ci': contentId,
        if (attachments != null) 'attach': attachments!.toJson(),
        if (mimeParts.isNotEmpty) 'mp': mimeParts.map((mp) => mp.toJson()).toList(),
      };
}
