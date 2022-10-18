// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_envelope.dart';
import 'package:zimbra_api/src/common/type/soap_header.dart';

import 'decline_counter_appointment_body.dart';

class DeclineCounterAppointmentEnvelope extends SoapEnvelope {
  DeclineCounterAppointmentEnvelope(DeclineCounterAppointmentBody body, {super.header}) : super(body);

  factory DeclineCounterAppointmentEnvelope.fromJson(Map<String, dynamic> json) =>
      DeclineCounterAppointmentEnvelope(DeclineCounterAppointmentBody.fromJson(json['Body']),
          header: json['Header'] != null ? SoapHeader.fromJson(json['Header']) : null);

  DeclineCounterAppointmentBody get declineCounterAppointmentBody => body as DeclineCounterAppointmentBody;
}
