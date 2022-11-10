// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/enum/condition_operator.dart';

class EntrySearchFilterSingleCond {
  final String attr;

  final ConditionOperator op;

  final String? value;

  final bool? isNot;

  EntrySearchFilterSingleCond(this.attr, this.op, {this.value, this.isNot});

  factory EntrySearchFilterSingleCond.fromMap(Map<String, dynamic> data) => EntrySearchFilterSingleCond(
      data['attr'] ?? '',
      ConditionOperator.values.firstWhere(
        (op) => op.name == data['op'],
        orElse: () => ConditionOperator.equal,
      ),
      value: data['value'],
      isNot: data['not']);

  Map<String, dynamic> toMap() => {
        'attr': attr,
        'op': op.name,
        if (value != null) 'value': value,
        if (isNot != null) 'not': isNot,
      };
}
