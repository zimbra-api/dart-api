// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/enum/modify_attribute_operation.dart';

import 'new_contact_attr.dart';

/// Contact attributes to modify
class ModifyContactAttr extends NewContactAttr {
  /// Operation: "+" or "-"
  final ModifyAttributeOperation operation;

  ModifyContactAttr(
    super.name, {
    this.operation = ModifyAttributeOperation.add,
    super.attachId,
    super.id,
    super.part,
    super.value,
  });

  factory ModifyContactAttr.fromMap(Map<String, dynamic> data) => ModifyContactAttr(data['n'] ?? '',
      operation: ModifyAttributeOperation.values
          .firstWhere((op) => op.name == data['op'], orElse: () => ModifyAttributeOperation.add),
      attachId: data['aid'],
      id: data['id'],
      part: data['part'],
      value: data['_content']);

  @override
  Map<String, dynamic> toMap() => {
        'n': name,
        'op': operation.name,
        if (attachId != null) 'aid': attachId,
        if (id != null) 'id': id,
        if (part != null) 'part': part,
        if (value != null) '_content': value,
      };
}
