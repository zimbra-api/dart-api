// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_envelope.dart';
import 'package:zimbra_api/src/common/type/soap_header.dart';

import 'forward_appointment_body.dart';

class ForwardAppointmentEnvelope extends SoapEnvelope {
  ForwardAppointmentEnvelope(ForwardAppointmentBody body, {super.header}) : super(body);

  factory ForwardAppointmentEnvelope.fromJson(Map<String, dynamic> json) =>
      ForwardAppointmentEnvelope(ForwardAppointmentBody.fromJson(json['Body']),
          header: json['Header'] != null ? SoapHeader.fromJson(json['Header']) : null);

  ForwardAppointmentBody get forwardAppointmentBody => body as ForwardAppointmentBody;
}
