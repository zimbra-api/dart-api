// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_envelope.dart';
import 'package:zimbra_api/src/common/type/soap_header.dart';

import 'set_appointment_body.dart';

class SetAppointmentEnvelope extends SoapEnvelope {
  SetAppointmentEnvelope(SetAppointmentBody body, {super.header}) : super(body..response?.header = header);

  factory SetAppointmentEnvelope.fromMap(Map<String, dynamic> data) =>
      SetAppointmentEnvelope(SetAppointmentBody.fromMap(data['Body']),
          header: data['Header'] != null ? SoapHeader.fromMap(data['Header']) : null);
}
