// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_envelope.dart';
import 'package:zimbra_api/src/common/type/soap_header.dart';

import 'snooze_calendar_item_alarm_body.dart';

class SnoozeCalendarItemAlarmEnvelope extends SoapEnvelope {
  SnoozeCalendarItemAlarmEnvelope(SnoozeCalendarItemAlarmBody body, {super.header}) : super(body);

  factory SnoozeCalendarItemAlarmEnvelope.fromJson(Map<String, dynamic> json) =>
      SnoozeCalendarItemAlarmEnvelope(SnoozeCalendarItemAlarmBody.fromJson(json['Body']),
          header: json['Header'] != null ? SoapHeader.fromJson(json['Header']) : null);

  SnoozeCalendarItemAlarmBody get snoozeCalendarItemAlarmBody => body as SnoozeCalendarItemAlarmBody;
}
