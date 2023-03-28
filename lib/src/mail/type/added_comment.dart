// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

class AddedComment {
  /// Item ID of parent
  final String parentId;

  /// Comment text
  final String text;

  const AddedComment(this.parentId, this.text);

  factory AddedComment.fromMap(Map<String, dynamic> data) => AddedComment(
        data['parentId'] ?? '',
        data['text'] ?? '',
      );

  Map<String, dynamic> toMap() => {
        'parentId': parentId,
        'text': text,
      };
}
