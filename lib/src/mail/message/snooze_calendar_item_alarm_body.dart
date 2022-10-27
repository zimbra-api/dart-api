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

  factory SnoozeCalendarItemAlarmBody.fromJson(Map<String, dynamic> json) => SnoozeCalendarItemAlarmBody(
      response: json['SnoozeCalendarItemAlarmResponse'] != null
          ? SnoozeCalendarItemAlarmResponse.fromJson(json['SnoozeCalendarItemAlarmResponse'])
          : null,
      fault: json['Fault'] != null ? SoapFault.fromJson(json['Fault']) : null);

  SnoozeCalendarItemAlarmRequest? get snoozeCalendarItemAlarmRequest => request as SnoozeCalendarItemAlarmRequest?;

  SnoozeCalendarItemAlarmResponse? get snoozeCalendarItemAlarmResponse => response as SnoozeCalendarItemAlarmResponse?;

  @override
  Map<String, dynamic> toJson() => {
        if (request != null) 'SnoozeCalendarItemAlarmRequest': request!.toJson(),
      };
}
