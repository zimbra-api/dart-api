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

  const EntrySearchFilterInfo({this.condition, this.conditions});

  factory EntrySearchFilterInfo.fromMap(Map<String, dynamic> data) => EntrySearchFilterInfo(
      condition: data['cond']?[0] is Map ? EntrySearchFilterSingleCond.fromMap(data['cond'][0]) : null,
      conditions: data['conds']?[0] is Map ? EntrySearchFilterMultiCond.fromMap(data['conds'][0]) : null);

  Map<String, dynamic> toMap() => {
        if (condition != null) 'cond': [condition!.toMap()],
        if (conditions != null) 'conds': [conditions!.toMap()],
      };
}
