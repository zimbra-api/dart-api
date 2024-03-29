// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

class Attachment {
  /// Attachment id
  final String attachmentId;

  /// File name
  final String fileName;

  /// Content type
  final String contentType;

  final int size;

  const Attachment(
    this.attachmentId,
    this.fileName, [
    this.contentType = '',
    this.size = 0,
  ]);

  factory Attachment.fromMap(Map<String, dynamic> data) => Attachment(
        data['aid'] ?? '',
        data['filename'] ?? '',
        data['ct'] ?? '',
        data['s'] ?? 0,
      );
}
