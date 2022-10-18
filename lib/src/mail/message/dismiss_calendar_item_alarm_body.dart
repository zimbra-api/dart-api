// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_body.dart';
import 'package:zimbra_api/src/common/type/soap_fault.dart';

import 'dismiss_calendar_item_alarm_request.dart';
import 'dismiss_calendar_item_alarm_response.dart';

class DismissCalendarItemAlarmBody extends SoapBody {
  DismissCalendarItemAlarmBody(
      {DismissCalendarItemAlarmRequest? request, DismissCalendarItemAlarmResponse? response, super.fault})
      : super(request: request, response: response);

  factory DismissCalendarItemAlarmBody.fromJson(Map<String, dynamic> json) => DismissCalendarItemAlarmBody(
      response: json['DismissCalendarItemAlarmResponse'] != null
          ? DismissCalendarItemAlarmResponse.fromJson(json['DismissCalendarItemAlarmResponse'])
          : null,
      fault: json['Fault'] != null ? SoapFault.fromJson(json['Fault']) : null);

  DismissCalendarItemAlarmRequest? get dismissCalendarItemAlarmRequest => request as DismissCalendarItemAlarmRequest?;

  DismissCalendarItemAlarmResponse? get dismissCalendarItemAlarmResponse =>
      response as DismissCalendarItemAlarmResponse?;

  @override
  Map<String, dynamic> toJson() => {
        if (request != null) 'DismissCalendarItemAlarmRequest': request!.toJson(),
      };
}
