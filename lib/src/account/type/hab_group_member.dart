// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/named_value.dart';

import 'hab_member.dart';

class HABGroupMember extends HABMember {
  /// Member attributes. Currently only these attributes are returned: zimbraId, displayName
  final List<NamedValue> attrs;

  HABGroupMember(super.name, {super.seniorityIndex, this.attrs = const []});

  factory HABGroupMember.fromMap(Map<String, dynamic> data) => HABGroupMember(
        data['name']?['_content'] ?? '',
        seniorityIndex: data['seniorityIndex'],
        attrs: (data['attr'] is Iterable)
            ? List.from((data['attr'] as Iterable).map<NamedValue>((attr) => NamedValue.fromMap(attr)))
            : [],
      );

  Map<String, dynamic> toMap() => {
        'name': {'_content': name},
        if (seniorityIndex != null) 'seniorityIndex': seniorityIndex,
        if (attrs.isNotEmpty) 'attr': attrs.map((attr) => attr.toMap()).toList(),
      };
}
