// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

class DeleteItemNotification {
  /// ID of deleted item
  final int? id;

  /// Type of deleted item
  final String? type;

  DeleteItemNotification({this.id, this.type});

  factory DeleteItemNotification.fromJson(Map<String, dynamic> json) =>
      DeleteItemNotification(id: json['id'], type: json['t']);

  Map<String, dynamic> toJson() => {
        if (id != null) 'id': id,
        if (type != null) 't': type,
      };
}
