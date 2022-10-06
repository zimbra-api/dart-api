// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/named_value.dart';

import 'hab_member.dart';

class HABGroupMember extends HABMember {
  /// Member attributes. Currently only these attributes are returned: zimbraId, displayName
  final List<NamedValue> attrs;

  HABGroupMember(super.name, {super.seniorityIndex, this.attrs = const <NamedValue>[]});

  factory HABGroupMember.fromJson(Map<String, dynamic> json) {
    final member = HABGroupMember(json['name'], seniorityIndex: json['seniorityIndex']);

    if (json['attr'] != null && json['attr'] is Iterable) {
      final attrs = json['attr'] as Iterable;
      for (final attr in attrs) {
        member.attrs.add(NamedValue.fromJson(attr));
      }
    }

    return member;
  }

  Map<String, dynamic> toJson() => {
        'name': {'_content': name},
        if (seniorityIndex != null) 'seniorityIndex': seniorityIndex,
        if (attrs.isNotEmpty) 'attr': attrs.map((attr) => attr.toJson()),
      };
}
