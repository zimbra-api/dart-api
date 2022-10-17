// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

class PartInfo {
  /// MIME part name. "" means top-level part, 1 first part, 1.1 first part of a multipart inside of 1.
  final String part;

  /// MIME Content-Type. The mime type is the content of the element.
  final String contentType;

  /// Size in bytes
  final int? size;

  /// MIME Content-Disposition
  final String? contentDisposition;

  /// Filename attribute from the Content-Disposition param list
  final String? contentFilename;

  /// MIME Content-ID (for display of embedded images)
  final String? contentId;

  /// MIME/Microsoft Content-Location (for display of embedded images)
  final String? location;

  /// Set if this part is considered to be the "body" of the message for display purposes.
  final bool? body;

  /// Set if the content for the part is truncated
  final bool? truncatedContent;

  /// The content of the part, if requested
  final String? content;

  /// Mime parts
  final List<PartInfo> mimeParts;

  PartInfo(this.part, this.contentType,
      {this.size,
      this.contentDisposition,
      this.contentFilename,
      this.contentId,
      this.location,
      this.body,
      this.truncatedContent,
      this.content,
      this.mimeParts = const []});

  factory PartInfo.fromJson(Map<String, dynamic> json) => PartInfo(json['part'] ?? '', json['ct'] ?? '',
      size: json['s'],
      contentDisposition: json['cd'],
      contentFilename: json['filename'],
      contentId: json['ci'],
      location: json['cl'],
      body: json['body'],
      truncatedContent: json['truncated'],
      content: json['content']?['_content'],
      mimeParts: (json['mp'] is Iterable)
          ? List.from((json['mp'] as Iterable).map<PartInfo>((mp) => PartInfo.fromJson(mp)))
          : []);

  Map<String, dynamic> toJson() => {
        'part': part,
        'ct': contentType,
        if (size != null) 's': size,
        if (contentDisposition != null) 'cd': contentDisposition,
        if (contentFilename != null) 'filename': contentFilename,
        if (contentId != null) 'ci': contentId,
        if (location != null) 'cl': location,
        if (body != null) 'body': body,
        if (truncatedContent != null) 'truncated': truncatedContent,
        if (content != null) 'content': {'_content': content},
        if (mimeParts.isNotEmpty) 'mp': mimeParts.map((mp) => mp.toJson()).toList(),
      };
}
