// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'entry_search_filter_multi_cond.dart';
import 'entry_search_filter_single_cond.dart';

class EntrySearchFilterInfo {
  /// Search filter simple condition
  final EntrySearchFilterSingleCond? condition;

  /// Search filter compound condition
  final EntrySearchFilterMultiCond? conditions;

  EntrySearchFilterInfo({this.condition, this.conditions});

  factory EntrySearchFilterInfo.fromJson(Map<String, dynamic> json) => EntrySearchFilterInfo(
      condition: json['cond']?[0] is Map ? EntrySearchFilterSingleCond.fromJson(json['cond'][0]) : null,
      conditions: json['conds']?[0] is Map ? EntrySearchFilterMultiCond.fromJson(json['conds'][0]) : null);

  Map<String, dynamic> toJson() => {
        if (condition != null) 'cond': [condition!.toJson()],
        if (conditions != null) 'conds': [conditions!.toJson()],
      };
}
