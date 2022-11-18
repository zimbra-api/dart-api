// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'add_recurrence_info.dart';
import 'cancel_rule_info.dart';
import 'exception_rule_info.dart';
import 'recurrence_info.dart';
import 'simple_repeating_rule.dart';
import 'single_dates.dart';

class ExcludeRecurrenceInfo extends RecurrenceInfo {
  const ExcludeRecurrenceInfo({
    super.add = const [],
    super.exclude = const [],
    super.except = const [],
    super.cancel = const [],
    super.dates = const [],
    super.simple = const [],
  });

  factory ExcludeRecurrenceInfo.fromMap(Map<String, dynamic> data) => ExcludeRecurrenceInfo(
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
