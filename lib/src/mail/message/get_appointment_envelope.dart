// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_envelope.dart';
import 'package:zimbra_api/src/common/type/soap_header.dart';

import 'get_appointment_body.dart';

class GetAppointmentEnvelope extends SoapEnvelope {
  GetAppointmentEnvelope(GetAppointmentBody body, {super.header}) : super(body);

  factory GetAppointmentEnvelope.fromJson(Map<String, dynamic> json) =>
      GetAppointmentEnvelope(GetAppointmentBody.fromJson(json['Body']),
          header: json['Header'] != null ? SoapHeader.fromJson(json['Header']) : null);

  GetAppointmentBody get getAppointmentBody => body as GetAppointmentBody;
}