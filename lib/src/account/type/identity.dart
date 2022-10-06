// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'attr.dart';
import 'attrs.dart';

class Identity extends Attrs {
  final String? name;

  final String? id;

  Identity({this.name, this.id, super.attrs});

  factory Identity.fromJson(Map<String, dynamic> json) {
    final identity = Identity(name: json['name'], id: json['id']);

    if (json['a'] != null && json['a'] is Iterable) {
      final attrs = json['a'] as Iterable;
      for (final attr in attrs) {
        identity.attrs.add(Attr.fromJson(attr));
      }
    }

    return identity;
  }

  Map<String, dynamic> toJson() => {
        if (name != null) 'name': name,
        if (id != null) 'id': id,
        if (attrs.isNotEmpty) 'a': attrs.map((a) => a.toJson()),
      };
}
