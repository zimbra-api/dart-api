// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/mail/type/updated_alarm_info.dart';

import 'dismiss_calendar_item_alarm_response.dart';

class SnoozeCalendarItemAlarmResponse extends DismissCalendarItemAlarmResponse {
  SnoozeCalendarItemAlarmResponse({super.apptUpdatedAlarms = const [], super.taskUpdatedAlarms = const []});

  factory SnoozeCalendarItemAlarmResponse.fromMap(Map<String, dynamic> data) => SnoozeCalendarItemAlarmResponse(
      apptUpdatedAlarms: (data['appt'] is Iterable)
          ? (data['appt'] as Iterable)
              .map<UpdatedAlarmInfo>((appt) => UpdatedAlarmInfo.fromMap(appt))
              .toList(growable: false)
          : const [],
      taskUpdatedAlarms: (data['task'] is Iterable)
          ? (data['task'] as Iterable)
              .map<UpdatedAlarmInfo>((task) => UpdatedAlarmInfo.fromMap(task))
              .toList(growable: false)
          : const []);
}
