// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import '../../common/enum/alarm_action.dart';
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

  const AlarmInfo({
    this.action,
    this.trigger,
    this.repeat,
    this.description,
    this.attach,
    this.summary,
    this.attendees = const [],
    this.xProps = const [],
  });

  factory AlarmInfo.fromMap(Map<String, dynamic> data) => AlarmInfo(
        action: AlarmAction.values.firstWhere(
          (item) => item.name == data['action'],
          orElse: () => AlarmAction.display,
        ),
        trigger: data['trigger'] is Map
            ? AlarmTriggerInfo.fromMap(
                data['trigger'],
              )
            : null,
        repeat: data['repeat'] is Map
            ? DurationInfo.fromMap(
                data['repeat'],
              )
            : null,
        description: data['desc'] is Map ? data['desc']['_content'] : null,
        attach: data['attach'] is Map
            ? CalendarAttach.fromMap(
                data['attach'],
              )
            : null,
        summary: data['summary']?['_content'],
        attendees: (data['at'] is Iterable)
            ? (data['at'] as Iterable)
                .map<CalendarAttendee>((at) => CalendarAttendee.fromMap(at))
                .toList(growable: false)
            : const [],
        xProps: (data['xprop'] is Iterable)
            ? (data['xprop'] as Iterable)
                .map<XProp>(
                  (xprop) => XProp.fromMap(xprop),
                )
                .toList(growable: false)
            : const [],
      );

  Map<String, dynamic> toMap() => {
        if (action != null) 'action': action!.name,
        if (trigger != null) 'trigger': trigger!.toMap(),
        if (repeat != null) 'repeat': repeat!.toMap(),
        if (description != null) 'desc': {'_content': description},
        if (attach != null) 'attach': attach!.toMap(),
        if (summary != null) 'summary': {'_content': summary},
        if (attendees.isNotEmpty)
          'at': attendees
              .map(
                (at) => at.toMap(),
              )
              .toList(growable: false),
        if (xProps.isNotEmpty)
          'xprop': xProps
              .map(
                (xprop) => xprop.toMap(),
              )
              .toList(growable: false),
      };
}
