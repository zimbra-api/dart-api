// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/enum/alarm_action.dart';

import 'alarm_trigger_info.dart';
import 'calendar_attach.dart';
import 'calendar_attendee.dart';
import 'duration_info.dart';
import 'xprop.dart';

class AlarmInfo {
  /// Alarm action
  /// Possible values: DISPLAY|AUDIO|EMAIL|PROCEDURE|X_YAHOO_CALENDAR_ACTION_IM|X_YAHOO_CALENDAR_ACTION_MOBILE
  final AlarmAction? action;

  /// Alarm trigger information
  final AlarmTriggerInfo? trigger;

  /// Alarm repeat information
  final DurationInfo? repeat;

  /// Alarm description
  /// action=DISPLAY: Reminder text to display
  /// action=EMAIL|X_YAHOO_CALENDAR_ACTION_IM|X_YAHOO_CALENDAR_ACTION_MOBILE: EMail body
  /// action=PROCEDURE: Description text
  final String? description;

  /// Information on attachment
  final CalendarAttach? attach;

  /// Alarm summary
  final String? summary;

  /// Attendee information
  final List<CalendarAttendee> attendees;

  /// Non-standard properties (see RFC2445 section 4.8.8.1)
  final List<XProp> xProps;

  AlarmInfo(
      {this.action,
      this.trigger,
      this.repeat,
      this.description,
      this.attach,
      this.summary,
      this.attendees = const [],
      this.xProps = const []});

  factory AlarmInfo.fromJson(Map<String, dynamic> json) {
    final action = AlarmAction.values.firstWhere(
      (item) => item.name == json['action'],
      orElse: () => AlarmAction.display,
    );

    final attendees = <CalendarAttendee>[];
    if (json['at'] != null && json['at'] is Iterable) {
      final elements = json['at'] as Iterable;
      for (final at in elements) {
        attendees.add(CalendarAttendee.fromJson(at));
      }
    }

    final xProps = <XProp>[];
    if (json['xprop'] != null && json['xprop'] is Iterable) {
      final elements = json['xprop'] as Iterable;
      for (final xprop in elements) {
        xProps.add(XProp.fromJson(xprop));
      }
    }

    return AlarmInfo(
        action: action,
        trigger: json['trigger'] != null ? AlarmTriggerInfo.fromJson(json['trigger']) : null,
        repeat: json['repeat'] != null ? DurationInfo.fromJson(json['repeat']) : null,
        description: json['desc'] != null ? json['desc']['_content'] : null,
        attach: json['attach'] != null ? CalendarAttach.fromJson(json['attach']) : null,
        summary: json['summary'] != null ? json['summary']['_content'] : null,
        attendees: attendees,
        xProps: xProps);
  }

  Map<String, dynamic> toJson() => {
        if (action != null) 'action': action!.name,
        if (trigger != null) 'trigger': trigger!.toJson(),
        if (repeat != null) 'repeat': repeat!.toJson(),
        if (description != null) 'desc': {'_content': description},
        if (attach != null) 'attach': attach!.toJson(),
        if (summary != null) 'summary': {'_content': summary},
        if (attendees.isNotEmpty) 'at': attendees.map((at) => at.toJson()).toList(),
        if (xProps.isNotEmpty) 'xprop': xProps.map((xprop) => xprop.toJson()).toList(),
      };
}
