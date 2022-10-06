// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

class Id {
  final String? id;

  Id({this.id});

  factory Id.fromJson(Map<String, dynamic> json) => Id(id: json['id']);

  Map<String, dynamic> toJson() => {
        if (id != null) 'id': id,
      };
}
