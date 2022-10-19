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

  factory RecurrenceInfo.fromJson(Map<String, dynamic> json) => RecurrenceInfo(
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
      simple: (json['rule'] is Iterable)
          ? List.from(
              (json['rule'] as Iterable).map<SimpleRepeatingRule>((simple) => SimpleRepeatingRule.fromJson(simple)))
          : []);

  Map<String, dynamic> toJson() => {
        if (add.isNotEmpty) 'add': add.map((rule) => rule.toJson()).toList(),
        if (exclude.isNotEmpty) 'exclude': exclude.map((rule) => rule.toJson()).toList(),
        if (except.isNotEmpty) 'except': except.map((rule) => rule.toJson()).toList(),
        if (cancel.isNotEmpty) 'cancel': cancel.map((rule) => rule.toJson()).toList(),
        if (dates.isNotEmpty) 'dates': dates.map((rule) => rule.toJson()).toList(),
        if (simple.isNotEmpty) 'rule': simple.map((rule) => rule.toJson()).toList(),
      };
}
