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

  factory EntrySearchFilterMultiCond.fromJson(Map<String, dynamic> json) => EntrySearchFilterMultiCond(
        isNot: json['not'],
        isOr: json['or'],
        singleConditions: (json['cond'] is Iterable)
            ? List.from((json['cond'] as Iterable)
                .map<EntrySearchFilterSingleCond>((cond) => EntrySearchFilterSingleCond.fromJson(cond)))
            : [],
        compoundConditions: (json['conds'] is Iterable)
            ? List.from((json['conds'] as Iterable)
                .map<EntrySearchFilterMultiCond>((conds) => EntrySearchFilterMultiCond.fromJson(conds)))
            : [],
      );

  Map<String, dynamic> toJson() => {
        if (isNot != null) 'not': isNot,
        if (isOr != null) 'or': isOr,
        if (singleConditions.isNotEmpty) 'cond': singleConditions.map((cond) => cond.toJson()).toList(),
        if (compoundConditions.isNotEmpty) 'conds': compoundConditions.map((cond) => cond.toJson()).toList(),
      };
}
