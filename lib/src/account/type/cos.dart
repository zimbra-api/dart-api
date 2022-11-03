// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

class Cos {
  /// Class of Service (COS) ID
  final String? id;

  /// Class of Service (COS) name
  final String? name;

  Cos({this.id, this.name});

  factory Cos.fromMap(Map<String, dynamic> data) => Cos(id: data['id'], name: data['name']);

  Map<String, dynamic> toMap() => {
        if (id != null) 'id': id,
        if (name != null) 'name': name,
      };
}
