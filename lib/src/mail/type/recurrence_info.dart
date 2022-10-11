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

  factory RecurrenceInfo.fromJson(Map<String, dynamic> json) {
    final add = <AddRecurrenceInfo>[];
    if (json['add'] != null && json['add'] is Iterable) {
      final rules = json['add'] as Iterable;
      for (final rule in rules) {
        add.add(AddRecurrenceInfo.fromJson(rule));
      }
    }

    final exclude = <ExcludeRecurrenceInfo>[];
    if (json['exclude'] != null && json['exclude'] is Iterable) {
      final rules = json['exclude'] as Iterable;
      for (final rule in rules) {
        exclude.add(ExcludeRecurrenceInfo.fromJson(rule));
      }
    }

    final except = <ExceptionRuleInfo>[];
    if (json['except'] != null && json['except'] is Iterable) {
      final rules = json['except'] as Iterable;
      for (final rule in rules) {
        except.add(ExceptionRuleInfo.fromJson(rule));
      }
    }

    final cancel = <CancelRuleInfo>[];
    if (json['cancel'] != null && json['cancel'] is Iterable) {
      final rules = json['cancel'] as Iterable;
      for (final rule in rules) {
        cancel.add(CancelRuleInfo.fromJson(rule));
      }
    }

    final dates = <SingleDates>[];
    if (json['dates'] != null && json['dates'] is Iterable) {
      final rules = json['dates'] as Iterable;
      for (final rule in rules) {
        dates.add(SingleDates.fromJson(rule));
      }
    }

    final simple = <SimpleRepeatingRule>[];
    if (json['rule'] != null && json['rule'] is Iterable) {
      final rules = json['rule'] as Iterable;
      for (final rule in rules) {
        simple.add(SimpleRepeatingRule.fromJson(rule));
      }
    }

    return RecurrenceInfo(add: add, exclude: exclude, except: except, cancel: cancel, dates: dates, simple: simple);
  }

  Map<String, dynamic> toJson() => {
        if (add.isNotEmpty) 'add': add.map((rule) => rule.toJson()).toList(),
        if (exclude.isNotEmpty) 'exclude': exclude.map((rule) => rule.toJson()).toList(),
        if (except.isNotEmpty) 'except': except.map((rule) => rule.toJson()).toList(),
        if (cancel.isNotEmpty) 'cancel': cancel.map((rule) => rule.toJson()).toList(),
        if (dates.isNotEmpty) 'dates': dates.map((rule) => rule.toJson()).toList(),
        if (simple.isNotEmpty) 'rule': simple.map((rule) => rule.toJson()).toList(),
      };
}
