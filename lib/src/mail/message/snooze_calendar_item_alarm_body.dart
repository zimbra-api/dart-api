// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_body.dart';
import 'package:zimbra_api/src/common/type/soap_fault.dart';

import 'snooze_calendar_item_alarm_request.dart';
import 'snooze_calendar_item_alarm_response.dart';

class SnoozeCalendarItemAlarmBody extends SoapBody {
  SnoozeCalendarItemAlarmBody(
      {SnoozeCalendarItemAlarmRequest? request, SnoozeCalendarItemAlarmResponse? response, super.fault})
      : super(request: request, response: response);

  factory SnoozeCalendarItemAlarmBody.fromMap(Map<String, dynamic> data) => SnoozeCalendarItemAlarmBody(
      response: data['SnoozeCalendarItemAlarmResponse'] != null
          ? SnoozeCalendarItemAlarmResponse.fromMap(data['SnoozeCalendarItemAlarmResponse'])
          : null,
      fault: data['Fault'] != null ? SoapFault.fromMap(data['Fault']) : null);

  @override
  Map<String, dynamic> toMap() => {
        if (request != null) 'SnoozeCalendarItemAlarmRequest': request!.toMap(),
      };
}
