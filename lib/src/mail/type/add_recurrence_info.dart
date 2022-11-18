// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'cancel_rule_info.dart';
import 'exception_rule_info.dart';
import 'exclude_recurrence_info.dart';
import 'recurrence_info.dart';
import 'simple_repeating_rule.dart';
import 'single_dates.dart';

class AddRecurrenceInfo extends RecurrenceInfo {
  const AddRecurrenceInfo({
    super.add = const [],
    super.exclude = const [],
    super.except = const [],
    super.cancel = const [],
    super.dates = const [],
    super.simple = const [],
  });

  factory AddRecurrenceInfo.fromMap(Map<String, dynamic> data) => AddRecurrenceInfo(
      add: (data['add'] is Iterable)
          ? (data['add'] as Iterable)
              .map<AddRecurrenceInfo>((add) => AddRecurrenceInfo.fromMap(add))
              .toList(growable: false)
          : const [],
      exclude: (data['exclude'] is Iterable)
          ? (data['exclude'] as Iterable)
              .map<ExcludeRecurrenceInfo>((exclude) => ExcludeRecurrenceInfo.fromMap(exclude))
              .toList(growable: false)
          : const [],
      except: (data['except'] is Iterable)
          ? (data['except'] as Iterable)
              .map<ExceptionRuleInfo>((except) => ExceptionRuleInfo.fromMap(except))
              .toList(growable: false)
          : const [],
      cancel: (data['cancel'] is Iterable)
          ? (data['cancel'] as Iterable)
              .map<CancelRuleInfo>((cancel) => CancelRuleInfo.fromMap(cancel))
              .toList(growable: false)
          : const [],
      dates: (data['dates'] is Iterable)
          ? (data['dates'] as Iterable).map<SingleDates>((dates) => SingleDates.fromMap(dates)).toList(growable: false)
          : const [],
      simple: (data['simple'] is Iterable)
          ? (data['simple'] as Iterable)
              .map<SimpleRepeatingRule>((simple) => SimpleRepeatingRule.fromMap(simple))
              .toList(growable: false)
          : const []);
}
