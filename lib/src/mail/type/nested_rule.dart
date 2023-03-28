// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'filter_actions.dart';
import 'filter_tests.dart';
import 'filter_variables.dart';

class NestedRule {
  /// Filter Variables
  final FilterVariables? filterVariables;

  /// Filter tests
  final FilterTests? filterTests;

  /// Filter actions
  final FilterActions? filterActions;

  /// NestedRule child
  final NestedRule? child;

  const NestedRule({
    this.filterVariables,
    this.filterTests,
    this.filterActions,
    this.child,
  });

  factory NestedRule.fromMap(Map<String, dynamic> data) => NestedRule(
        filterVariables: data['filterVariables'] is Map
            ? FilterVariables.fromMap(
                data['filterVariables'],
              )
            : null,
        filterTests: data['filterTests'] is Map
            ? FilterTests.fromMap(
                data['filterTests'],
              )
            : null,
        filterActions: data['filterActions'] is Map
            ? FilterActions.fromMap(
                data['filterActions'],
              )
            : null,
        child: data['nestedRule'] is Map
            ? NestedRule.fromMap(
                data['nestedRule'],
              )
            : null,
      );

  Map<String, dynamic> toMap() => {
        if (filterVariables != null)
          'filterVariables': filterVariables!.toMap(),
        if (filterTests != null) 'filterTests': filterTests!.toMap(),
        if (filterActions != null) 'filterActions': filterActions!.toMap(),
        if (child != null) 'nestedRule': child!.toMap(),
      };
}
