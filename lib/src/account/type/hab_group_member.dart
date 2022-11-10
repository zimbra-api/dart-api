// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/named_value.dart';

import 'hab_member.dart';

class HABGroupMember extends HABMember {
  /// Member attributes. Currently only these attributes are returned: zimbraId, displayName
  /// zimbraId: the unique UUID of the hab member
  /// displayName: display name for the member
  final List<NamedValue> attrs;

  HABGroupMember(super.name, {super.seniorityIndex, this.attrs = const []});

  factory HABGroupMember.fromMap(Map<String, dynamic> data) => HABGroupMember(
        data['name'] ?? '',
        seniorityIndex: int.tryParse(data['seniorityIndex']?.toString() ?? ''),
        attrs: (data['_attrs'] is Map)
            ? (data['_attrs'] as Map<String, dynamic>)
                .entries
                .map<NamedValue>((attr) => NamedValue(attr.key, value: attr.value))
                .toList(growable: false)
            : const [],
      );

  Map<String, dynamic> toMap() => {
        'name': name,
        if (seniorityIndex != null) 'seniorityIndex': seniorityIndex,
        if (attrs.isNotEmpty) 'attr': attrs.map((attr) => attr.toMap()).toList(growable: false),
      };
}
