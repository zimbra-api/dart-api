// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

class Notification {
  /// Truncated flag
  final bool? truncatedContent;

  /// Content
  final String? content;

  const Notification({this.truncatedContent, this.content});

  factory Notification.fromMap(Map<String, dynamic> data) => Notification(
        truncatedContent: data['truncated'],
        content: data['content'],
      );

  Map<String, dynamic> toMap() => {
        if (truncatedContent != null) 'truncated': truncatedContent,
        if (content != null) 'content': content,
      };
}
