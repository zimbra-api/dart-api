// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_envelope.dart';
import 'package:zimbra_api/src/common/type/soap_header.dart';

import 'dismiss_calendar_item_alarm_body.dart';

class DismissCalendarItemAlarmEnvelope extends SoapEnvelope {
  DismissCalendarItemAlarmEnvelope(DismissCalendarItemAlarmBody body, {super.header})
      : super(body..response?.header = header);

  factory DismissCalendarItemAlarmEnvelope.fromMap(Map<String, dynamic> data) =>
      DismissCalendarItemAlarmEnvelope(DismissCalendarItemAlarmBody.fromMap(data['Body']),
          header: data['Header'] != null ? SoapHeader.fromMap(data['Header']) : null);

  DismissCalendarItemAlarmBody get dismissCalendarItemAlarmBody => body as DismissCalendarItemAlarmBody;
}
