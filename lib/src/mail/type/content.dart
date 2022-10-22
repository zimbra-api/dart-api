// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

class Content {
  /// Attachment upload ID of uploaded object to use
  final String? attachUploadId;

  /// Inlined content data. Ignored if "aid" is specified
  final String? value;

  Content({this.attachUploadId, this.value});

  factory Content.fromJson(Map<String, dynamic> json) => Content(attachUploadId: json['aid'], value: json['_content']);

  Map<String, dynamic> toJson() => {
        if (attachUploadId != null) 'aid': attachUploadId,
        if (value != null) '_content': value,
      };
}
