// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'attr.dart';

class ChildAccount {
  final String? id;

  final String? name;

  final bool? isVisible;

  final bool? isActive;

  final List<Attr> attrs;

  const ChildAccount({this.id, this.name, this.isVisible, this.isActive, this.attrs = const []});

  factory ChildAccount.fromMap(Map<String, dynamic> data) => ChildAccount(
        id: data['id'],
        name: data['name'],
        isVisible: data['visible'],
        isActive: data['active'],
        attrs: (data['attrs']?[0]['attr'] is Iterable)
            ? (data['attrs'][0]['attr'] as Iterable).map<Attr>((attr) => Attr.fromMap(attr)).toList(growable: false)
            : const [],
      );

  Map<String, dynamic> toMap() => {
        if (id != null) 'id': id,
        if (name != null) 'name': name,
        if (isVisible != null) 'visible': isVisible,
        if (isActive != null) 'active': isActive,
        if (attrs.isNotEmpty) 'attrs': {'attr': attrs.map((attr) => attr.toMap()).toList(growable: false)},
      };
}
