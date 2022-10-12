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

  ChildAccount({this.id, this.name, this.isVisible, this.isActive, this.attrs = const []});

  factory ChildAccount.fromJson(Map<String, dynamic> json) => ChildAccount(
        id: json['id'],
        name: json['name'],
        isVisible: json['visible'],
        isActive: json['active'],
        attrs: (json['attrs']?['attr'] is Iterable)
            ? List.from((json['attrs']['attr'] as Iterable).map<Attr>((attr) => Attr.fromJson(attr)))
            : [],
      );

  Map<String, dynamic> toJson() => {
        if (id != null) 'id': id,
        if (name != null) 'name': name,
        if (isVisible != null) 'visible': isVisible,
        if (isActive != null) 'active': isActive,
        if (attrs.isNotEmpty) 'attrs': {'attr': attrs.map((attr) => attr.toJson()).toList()},
      };
}
