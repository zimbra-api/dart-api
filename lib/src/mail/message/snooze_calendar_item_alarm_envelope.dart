// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import '../../common/type/soap_envelope.dart';
import '../../common/type/soap_header.dart';
import 'snooze_calendar_item_alarm_body.dart';

class SnoozeCalendarItemAlarmEnvelope extends SoapEnvelope {
  SnoozeCalendarItemAlarmEnvelope(
    SnoozeCalendarItemAlarmBody body, {
    super.header,
  }) : super(body..response?.header = header);

  factory SnoozeCalendarItemAlarmEnvelope.fromMap(
    Map<String, dynamic> data,
  ) =>
      SnoozeCalendarItemAlarmEnvelope(
        SnoozeCalendarItemAlarmBody.fromMap(data['Body']),
        header: data['Header'] != null
            ? SoapHeader.fromMap(
                data['Header'],
              )
            : null,
      );
}
