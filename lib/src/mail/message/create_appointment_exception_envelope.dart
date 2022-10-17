// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_envelope.dart';
import 'package:zimbra_api/src/common/type/soap_header.dart';

import 'create_appointment_exception_body.dart';

class CreateAppointmentExceptionEnvelope extends SoapEnvelope {
  CreateAppointmentExceptionEnvelope(CreateAppointmentExceptionBody body, {super.header}) : super(body);

  factory CreateAppointmentExceptionEnvelope.fromJson(Map<String, dynamic> json) =>
      CreateAppointmentExceptionEnvelope(CreateAppointmentExceptionBody.fromJson(json['Body']),
          header: json['Header'] != null ? SoapHeader.fromJson(json['Header']) : null);

  CreateAppointmentExceptionBody get createAppointmentExceptionBody => body as CreateAppointmentExceptionBody;
}
