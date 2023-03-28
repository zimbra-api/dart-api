// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

class MsgPartIds {
  /// Message ID
  final String? id;

  /// Comma separated list of part IDs to remove
  final String? partIds;

  const MsgPartIds({this.id, this.partIds});

  factory MsgPartIds.fromMap(Map<String, dynamic> data) => MsgPartIds(
        id: data['id'],
        partIds: data['part'],
      );

  Map<String, dynamic> toMap() => {
        if (id != null) 'id': id,
        if (partIds != null) 'part': partIds,
      };
}
