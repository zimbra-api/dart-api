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
  AddRecurrenceInfo(
      {super.add = const [],
      super.exclude = const [],
      super.except = const [],
      super.cancel = const [],
      super.dates = const [],
      super.simple = const []});

  factory AddRecurrenceInfo.fromJson(Map<String, dynamic> json) => AddRecurrenceInfo(
      add: (json['add'] is Iterable)
          ? List.from((json['add'] as Iterable).map<AddRecurrenceInfo>((add) => AddRecurrenceInfo.fromJson(add)))
          : [],
      exclude: (json['exclude'] is Iterable)
          ? List.from((json['exclude'] as Iterable)
              .map<ExcludeRecurrenceInfo>((exclude) => ExcludeRecurrenceInfo.fromJson(exclude)))
          : [],
      except: (json['except'] is Iterable)
          ? List.from(
              (json['except'] as Iterable).map<ExceptionRuleInfo>((except) => ExceptionRuleInfo.fromJson(except)))
          : [],
      cancel: (json['cancel'] is Iterable)
          ? List.from((json['cancel'] as Iterable).map<CancelRuleInfo>((cancel) => CancelRuleInfo.fromJson(cancel)))
          : [],
      dates: (json['dates'] is Iterable)
          ? List.from((json['dates'] as Iterable).map<SingleDates>((dates) => SingleDates.fromJson(dates)))
          : [],
      simple: (json['simple'] is Iterable)
          ? List.from(
              (json['simple'] as Iterable).map<SimpleRepeatingRule>((simple) => SimpleRepeatingRule.fromJson(simple)))
          : []);
}
