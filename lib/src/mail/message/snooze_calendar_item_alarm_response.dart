// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/mail/type/updated_alarm_info.dart';

import 'dismiss_calendar_item_alarm_response.dart';

class SnoozeCalendarItemAlarmResponse extends DismissCalendarItemAlarmResponse {
  SnoozeCalendarItemAlarmResponse({super.apptUpdatedAlarms = const [], super.taskUpdatedAlarms = const []});

  factory SnoozeCalendarItemAlarmResponse.fromJson(Map<String, dynamic> json) => SnoozeCalendarItemAlarmResponse(
      apptUpdatedAlarms: (json['appt'] is Iterable)
          ? List.from((json['appt'] as Iterable).map<UpdatedAlarmInfo>((appt) => UpdatedAlarmInfo.fromJson(appt)))
          : [],
      taskUpdatedAlarms: (json['task'] is Iterable)
          ? List.from((json['task'] as Iterable).map<UpdatedAlarmInfo>((task) => UpdatedAlarmInfo.fromJson(task)))
          : []);
}
