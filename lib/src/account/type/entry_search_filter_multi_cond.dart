// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'entry_search_filter_single_cond.dart';

class EntrySearchFilterMultiCond {
  /// Negation flag
  final bool? isNot;

  /// OR flag
  final bool? isOr;

  /// The list of compound conditions
  final List<EntrySearchFilterMultiCond> compoundConditions;

  /// The list of simple conditions
  final List<EntrySearchFilterSingleCond> singleConditions;

  EntrySearchFilterMultiCond(
      {this.isNot,
      this.isOr,
      this.compoundConditions = const <EntrySearchFilterMultiCond>[],
      this.singleConditions = const <EntrySearchFilterSingleCond>[]});

  factory EntrySearchFilterMultiCond.fromJson(Map<String, dynamic> json) {
    final cond = EntrySearchFilterMultiCond(isNot: json['not'], isOr: json['or']);

    if (json['conds'] != null && json['conds'] is Iterable) {
      final conds = json['conds'] as Iterable;
      for (final cond in conds) {
        cond.compoundConditions.add(EntrySearchFilterMultiCond.fromJson(cond));
      }
    }

    if (json['cond'] != null && json['cond'] is Iterable) {
      final conds = json['cond'] as Iterable;
      for (final cond in conds) {
        cond.singleConditions.add(EntrySearchFilterSingleCond.fromJson(cond));
      }
    }

    return cond;
  }

  Map<String, dynamic> toJson() => {
        if (isNot != null) 'not': isNot,
        if (isOr != null) 'or': isOr,
        if (compoundConditions.isNotEmpty) 'conds': compoundConditions.map((cond) => cond.toJson()),
        if (singleConditions.isNotEmpty) 'cond': singleConditions.map((cond) => cond.toJson()),
      };
}
