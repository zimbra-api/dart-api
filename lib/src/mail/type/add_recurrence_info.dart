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

  factory AddRecurrenceInfo.fromJson(Map<String, dynamic> json) {
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

    return AddRecurrenceInfo(add: add, exclude: exclude, except: except, cancel: cancel, dates: dates, simple: simple);
  }
}
