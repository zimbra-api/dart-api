// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'add_recurrence_info.dart';
import 'cancel_rule_info.dart';
import 'exception_rule_info.dart';
import 'exclude_recurrence_info.dart';
import 'simple_repeating_rule.dart';
import 'single_dates.dart';

/// Recurrence Information
class RecurrenceInfo {
  /// Recurrence rules for adding
  final List<AddRecurrenceInfo> add;

  /// Recurrence rules for excluding
  final List<ExcludeRecurrenceInfo> exclude;

  /// Recurrence rules for excepting
  final List<ExceptionRuleInfo> except;

  /// Recurrence rules for canceling
  final List<CancelRuleInfo> cancel;

  /// Recurrence rules for dates
  final List<SingleDates> dates;

  /// Simple recurrence rules
  final List<SimpleRepeatingRule> simple;

  RecurrenceInfo(
      {this.add = const [],
      this.exclude = const [],
      this.except = const [],
      this.cancel = const [],
      this.dates = const [],
      this.simple = const []});

  factory RecurrenceInfo.fromMap(Map<String, dynamic> data) => RecurrenceInfo(
      add: (data['add'] is Iterable)
          ? List.from((data['add'] as Iterable).map<AddRecurrenceInfo>((add) => AddRecurrenceInfo.fromMap(add)))
          : [],
      exclude: (data['exclude'] is Iterable)
          ? List.from((data['exclude'] as Iterable)
              .map<ExcludeRecurrenceInfo>((exclude) => ExcludeRecurrenceInfo.fromMap(exclude)))
          : [],
      except: (data['except'] is Iterable)
          ? List.from(
              (data['except'] as Iterable).map<ExceptionRuleInfo>((except) => ExceptionRuleInfo.fromMap(except)))
          : [],
      cancel: (data['cancel'] is Iterable)
          ? List.from((data['cancel'] as Iterable).map<CancelRuleInfo>((cancel) => CancelRuleInfo.fromMap(cancel)))
          : [],
      dates: (data['dates'] is Iterable)
          ? List.from((data['dates'] as Iterable).map<SingleDates>((dates) => SingleDates.fromMap(dates)))
          : [],
      simple: (data['rule'] is Iterable)
          ? List.from(
              (data['rule'] as Iterable).map<SimpleRepeatingRule>((simple) => SimpleRepeatingRule.fromMap(simple)))
          : []);

  Map<String, dynamic> toMap() => {
        if (add.isNotEmpty) 'add': add.map((rule) => rule.toMap()).toList(),
        if (exclude.isNotEmpty) 'exclude': exclude.map((rule) => rule.toMap()).toList(),
        if (except.isNotEmpty) 'except': except.map((rule) => rule.toMap()).toList(),
        if (cancel.isNotEmpty) 'cancel': cancel.map((rule) => rule.toMap()).toList(),
        if (dates.isNotEmpty) 'dates': dates.map((rule) => rule.toMap()).toList(),
        if (simple.isNotEmpty) 'rule': simple.map((rule) => rule.toMap()).toList(),
      };
}
