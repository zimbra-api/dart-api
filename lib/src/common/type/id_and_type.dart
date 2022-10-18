// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

class IdAndType {
  /// The id
  final String? id;

  /// The type
  final String? type;

  IdAndType({this.id, this.type});

  factory IdAndType.fromJson(Map<String, dynamic> json) => IdAndType(id: json['id'], type: json['type']);

  Map<String, dynamic> toJson() => {
        if (id != null) 'id': id,
        if (type != null) 'type': type,
      };
}
