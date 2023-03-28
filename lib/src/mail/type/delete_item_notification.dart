// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

class DeleteItemNotification {
  /// ID of deleted item
  final int? id;

  /// Type of deleted item
  final String? type;

  const DeleteItemNotification({this.id, this.type});

  factory DeleteItemNotification.fromMap(
    Map<String, dynamic> data,
  ) =>
      DeleteItemNotification(
        id: int.tryParse(data['id']?.toString() ?? ''),
        type: data['t'],
      );

  Map<String, dynamic> toMap() => {
        if (id != null) 'id': id,
        if (type != null) 't': type,
      };
}
