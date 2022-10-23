// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/enum/modify_attribute_operation.dart';

import 'new_contact_attr.dart';

/// Contact attributes to modify
class ModifyContactAttr extends NewContactAttr {
  /// Operation: "+" or "-"
  final ModifyAttributeOperation operation;

  ModifyContactAttr(super.name,
      {this.operation = ModifyAttributeOperation.add, super.attachId, super.id, super.part, super.value});

  factory ModifyContactAttr.fromJson(Map<String, dynamic> json) => ModifyContactAttr(json['n'] ?? '',
      operation: ModifyAttributeOperation.values
          .firstWhere((op) => op.name == json['op'], orElse: () => ModifyAttributeOperation.add),
      attachId: json['aid'],
      id: json['id'],
      part: json['part'],
      value: json['_content']);

  @override
  Map<String, dynamic> toJson() => {
        'n': name,
        'op': operation.name,
        if (attachId != null) 'aid': attachId,
        if (id != null) 'id': id,
        if (part != null) 'part': part,
        if (value != null) '_content': value,
      };
}
