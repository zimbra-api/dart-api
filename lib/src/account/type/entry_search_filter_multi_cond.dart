// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'entry_search_filter_single_cond.dart';

class EntrySearchFilterMultiCond {
  /// Negation flag
  final bool? isNot;

  /// OR flag
  final bool? isOr;

  /// The list of simple conditions
  final List<EntrySearchFilterSingleCond> singleConditions;

  /// The list of compound conditions
  final List<EntrySearchFilterMultiCond> compoundConditions;

  EntrySearchFilterMultiCond(
      {this.isNot, this.isOr, this.singleConditions = const [], this.compoundConditions = const []});

  factory EntrySearchFilterMultiCond.fromMap(Map<String, dynamic> data) => EntrySearchFilterMultiCond(
        isNot: data['not'],
        isOr: data['or'],
        singleConditions: (data['cond'] is Iterable)
            ? List.from((data['cond'] as Iterable)
                .map<EntrySearchFilterSingleCond>((cond) => EntrySearchFilterSingleCond.fromMap(cond)))
            : [],
        compoundConditions: (data['conds'] is Iterable)
            ? List.from((data['conds'] as Iterable)
                .map<EntrySearchFilterMultiCond>((conds) => EntrySearchFilterMultiCond.fromMap(conds)))
            : [],
      );

  Map<String, dynamic> toMap() => {
        if (isNot != null) 'not': isNot,
        if (isOr != null) 'or': isOr,
        if (singleConditions.isNotEmpty) 'cond': singleConditions.map((cond) => cond.toMap()).toList(),
        if (compoundConditions.isNotEmpty) 'conds': compoundConditions.map((cond) => cond.toMap()).toList(),
      };
}
