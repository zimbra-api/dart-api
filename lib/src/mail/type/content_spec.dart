// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

class ContentSpec {
  /// Attachment upload ID of uploaded object to use
  final String? attachmentId;

  /// Message ID of existing message. Used in conjunction with "part"
  final String? messageId;

  /// Part identifier. This combined with "mid" identifies a part of an existing message
  final String? part;

  /// Inlined content data. Ignored if "aid" or "mid"/"part" specified
  final String? text;

  ContentSpec({this.attachmentId, this.messageId, this.part, this.text});

  factory ContentSpec.fromJson(Map<String, dynamic> json) =>
      ContentSpec(attachmentId: json['aid'], messageId: json['mid'], part: json['part'], text: json['_content']);

  Map<String, dynamic> toJson() => {
        if (attachmentId != null) 'aid': attachmentId,
        if (messageId != null) 'mid': messageId,
        if (part != null) 'part': part,
        if (text != null) '_content': text,
      };
}
