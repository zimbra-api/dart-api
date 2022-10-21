// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_header.dart';
import 'package:zimbra_api/src/common/type/soap_envelope.dart';
import 'package:zimbra_api/src/common/type/soap_request.dart';
import 'package:zimbra_api/src/mail/type/dismiss_alarm.dart';

import 'dismiss_calendar_item_alarm_body.dart';
import 'dismiss_calendar_item_alarm_envelope.dart';

/// Dismiss calendar item alarm
class DismissCalendarItemAlarmRequest extends SoapRequest {
  /// Details of appt alarms to dismiss
  final List<DismissAlarm> apptAlarms;

  /// Details of task alarms to dismiss
  final List<DismissAlarm> taskAlarms;

  DismissCalendarItemAlarmRequest({this.apptAlarms = const [], this.taskAlarms = const []});

  @override
  SoapEnvelope getEnvelope({SoapHeader? header}) =>
      DismissCalendarItemAlarmEnvelope(DismissCalendarItemAlarmBody(request: this), header: header);

  @override
  Map<String, dynamic> toJson() => {
        '_jsns': 'urn:zimbraMail',
        if (apptAlarms.isNotEmpty) 'appt': apptAlarms.map((appt) => appt.toJson()).toList(),
        if (taskAlarms.isNotEmpty) 'task': taskAlarms.map((task) => task.toJson()).toList(),
      };
}