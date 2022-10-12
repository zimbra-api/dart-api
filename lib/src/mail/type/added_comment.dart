// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

class AddedComment {
  /// Item ID of parent
  final String parentId;

  /// Comment text
  final String text;

  AddedComment(this.parentId, this.text);

  factory AddedComment.fromJson(Map<String, dynamic> json) => AddedComment(json['parentId'] ?? '', json['text'] ?? '');

  Map<String, dynamic> toJson() => {
        'parentId': parentId,
        'text': text,
      };
}
