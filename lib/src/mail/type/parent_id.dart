// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

class ParentId {
  /// Item ID of parent
  final String parentId;

  ParentId({this.parentId = ''});

  factory ParentId.fromJson(Map<String, dynamic> json) => ParentId(parentId: json['parentId'] ?? '');

  Map<String, dynamic> toJson() => {
        'parentId': parentId,
      };
}
