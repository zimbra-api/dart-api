// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_envelope.dart';
import 'package:zimbra_api/src/common/type/soap_header.dart';

import 'counter_appointment_body.dart';

class CounterAppointmentEnvelope extends SoapEnvelope {
  CounterAppointmentEnvelope(CounterAppointmentBody body, {super.header}) : super(body);

  factory CounterAppointmentEnvelope.fromMap(Map<String, dynamic> data) =>
      CounterAppointmentEnvelope(CounterAppointmentBody.fromMap(data['Body']),
          header: data['Header'] != null ? SoapHeader.fromMap(data['Header']) : null);

  CounterAppointmentBody get counterAppointmentBody => body as CounterAppointmentBody;
}
