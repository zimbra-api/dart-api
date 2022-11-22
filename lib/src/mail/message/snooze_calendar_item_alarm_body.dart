// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import '../../common/type/soap_body.dart';
import 'snooze_calendar_item_alarm_request.dart';
import 'snooze_calendar_item_alarm_response.dart';

class SnoozeCalendarItemAlarmBody extends SoapBody {
  SnoozeCalendarItemAlarmBody(
      {SnoozeCalendarItemAlarmRequest? request, SnoozeCalendarItemAlarmResponse? response})
      : super(request: request, response: response);

  factory SnoozeCalendarItemAlarmBody.fromMap(Map<String, dynamic> data) => SnoozeCalendarItemAlarmBody(
      response: data['SnoozeCalendarItemAlarmResponse'] != null
          ? SnoozeCalendarItemAlarmResponse.fromMap(data['SnoozeCalendarItemAlarmResponse'])
          : null);

  @override
  Map<String, dynamic> toMap() => {
        if (request != null) 'SnoozeCalendarItemAlarmRequest': request!.toMap(),
      };
}
