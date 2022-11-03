// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_header.dart';
import 'package:zimbra_api/src/common/type/soap_envelope.dart';
import 'package:zimbra_api/src/common/type/soap_request.dart';
import 'package:zimbra_api/src/mail/type/snooze_alarm.dart';

import 'snooze_calendar_item_alarm_body.dart';
import 'snooze_calendar_item_alarm_envelope.dart';

/// Snooze alarm(s) for appointments or tasks
class SnoozeCalendarItemAlarmRequest extends SoapRequest {
  /// Details of appt alarms
  final List<SnoozeAlarm> apptAlarms;

  /// Details of task alarms
  final List<SnoozeAlarm> taskAlarms;

  SnoozeCalendarItemAlarmRequest({this.apptAlarms = const [], this.taskAlarms = const []});

  @override
  SoapEnvelope getEnvelope({SoapHeader? header}) =>
      SnoozeCalendarItemAlarmEnvelope(SnoozeCalendarItemAlarmBody(request: this), header: header);

  @override
  Map<String, dynamic> toMap() => {
        '_jsns': 'urn:zimbraMail',
        if (apptAlarms.isNotEmpty) 'appt': apptAlarms.map((appt) => appt.toMap()).toList(),
        if (taskAlarms.isNotEmpty) 'task': taskAlarms.map((task) => task.toMap()).toList(),
      };
}
