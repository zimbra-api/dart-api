// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

class Id {
  final String? id;

  Id({this.id});

  factory Id.fromMap(Map<String, dynamic> data) => Id(id: data['id']);

  Map<String, dynamic> toMap() => {
        if (id != null) 'id': id,
      };
}
