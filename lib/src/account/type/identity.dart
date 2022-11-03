// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'attr.dart';
import 'attrs.dart';

class Identity extends Attrs {
  final String? name;

  final String? id;

  Identity({this.name, this.id, super.attrs});

  factory Identity.fromMap(Map<String, dynamic> data) => Identity(
        name: data['name'],
        id: data['id'],
        attrs: (data['_attrs'] is Map)
            ? List.from(
                (data['_attrs'] as Map<String, dynamic>).entries.map<Attr>((attr) => Attr(attr.key, value: attr.value)))
            : [],
      );

  Map<String, dynamic> toMap() => {
        if (name != null) 'name': name,
        if (id != null) 'id': id,
        if (attrs.isNotEmpty) 'a': attrs.map((a) => a.toMap()).toList(),
      };
}
