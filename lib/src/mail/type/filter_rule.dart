// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'filter_actions.dart';
import 'filter_tests.dart';
import 'filter_variables.dart';
import 'nested_rule.dart';

class FilterRule {
  /// Rule name
  final String name;

  /// Active flag. Set by default.
  final bool active;

  /// Filter variables
  final FilterVariables? filterVariables;

  /// Filter tests
  final FilterTests? filterTests;

  /// Filter actions
  final FilterActions? filterActions;

  /// Nested rule
  final NestedRule? child;

  const FilterRule(
    this.name,
    this.active, {
    this.filterVariables,
    this.filterTests,
    this.filterActions,
    this.child,
  });

  factory FilterRule.fromMap(Map<String, dynamic> data) => FilterRule(data['name'] ?? '', data['active'] ?? false,
      filterVariables: data['filterVariables']?[0] is Map ? FilterVariables.fromMap(data['filterVariables'][0]) : null,
      filterTests: data['filterTests']?[0] is Map ? FilterTests.fromMap(data['filterTests'][0]) : null,
      filterActions: data['filterActions']?[0] is Map ? FilterActions.fromMap(data['filterActions'][0]) : null,
      child: data['nestedRule'] is Map ? NestedRule.fromMap(data['nestedRule']) : null);

  Map<String, dynamic> toMap() => {
        'name': name,
        'active': active,
        if (filterVariables != null) 'filterVariables': [filterVariables!.toMap()],
        if (filterTests != null) 'filterTests': [filterTests!.toMap()],
        if (filterActions != null) 'filterActions': [filterActions!.toMap()],
        if (child != null) 'nestedRule': child!.toMap(),
      };
}
