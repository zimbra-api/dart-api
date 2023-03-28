// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'filter_action.dart';
import 'filter_variable.dart';

class FilterVariables extends FilterAction {
  /// Filter variables
  final List<FilterVariable> variables;

  const FilterVariables({super.index, this.variables = const []});

  factory FilterVariables.fromMap(Map<String, dynamic> data) => FilterVariables(
        index: int.tryParse(data['index']?.toString() ?? ''),
        variables: (data['filterVariable'] is Iterable)
            ? (data['filterVariable'] as Iterable)
                .map<FilterVariable>(
                    (variable) => FilterVariable.fromMap(variable))
                .toList(growable: false)
            : const [],
      );

  @override
  Map<String, dynamic> toMap() => {
        if (index != null) 'index': index,
        if (variables.isNotEmpty)
          'filterVariable': variables
              .map(
                (variable) => variable.toMap(),
              )
              .toList(growable: false),
      };
}
