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

  factory DismissCalendarItemAlarmBody.fromMap(Map<String, dynamic> data) => DismissCalendarItemAlarmBody(
      response: data['DismissCalendarItemAlarmResponse'] != null
          ? DismissCalendarItemAlarmResponse.fromMap(data['DismissCalendarItemAlarmResponse'])
          : null,
      fault: data['Fault'] != null ? SoapFault.fromMap(data['Fault']) : null);

  @override
  Map<String, dynamic> toMap() => {
        if (request != null) 'DismissCalendarItemAlarmRequest': request!.toMap(),
      };
}
