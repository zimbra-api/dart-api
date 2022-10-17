// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

class Notification {
  /// Truncated flag
  final bool? truncatedContent;

  /// Content
  final String? content;

  Notification({this.truncatedContent, this.content});

  factory Notification.fromJson(Map<String, dynamic> json) =>
      Notification(truncatedContent: json['truncated'], content: json['content']?['_content']);

  Map<String, dynamic> toJson() => {
        if (truncatedContent != null) 'truncated': truncatedContent,
        if (content != null) 'content': {'_content': content},
      };
}
