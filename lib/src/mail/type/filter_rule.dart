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

  FilterRule(this.name, this.active, {this.filterVariables, this.filterTests, this.filterActions, this.child});

  factory FilterRule.fromJson(Map<String, dynamic> json) => FilterRule(json['name'] ?? '', json['active'] ?? false,
      filterVariables: json['filterVariables']?[0] is Map ? FilterVariables.fromJson(json['filterVariables'][0]) : null,
      filterTests: json['filterTests']?[0] is Map ? FilterTests.fromJson(json['filterTests'][0]) : null,
      filterActions: json['filterActions']?[0] is Map ? FilterActions.fromJson(json['filterActions'][0]) : null,
      child: json['nestedRule'] is Map ? NestedRule.fromJson(json['nestedRule']) : null);

  Map<String, dynamic> toJson() => {
        'name': name,
        'active': active,
        if (filterVariables != null) 'filterVariables': [filterVariables!.toJson()],
        if (filterTests != null) 'filterTests': [filterTests!.toJson()],
        if (filterActions != null) 'filterActions': [filterActions!.toJson()],
        if (child != null) 'nestedRule': child!.toJson(),
      };
}
