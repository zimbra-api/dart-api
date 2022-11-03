// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_body.dart';
import 'package:zimbra_api/src/common/type/soap_fault.dart';

import 'set_appointment_request.dart';
import 'set_appointment_response.dart';

class SetAppointmentBody extends SoapBody {
  SetAppointmentBody({SetAppointmentRequest? request, SetAppointmentResponse? response, super.fault})
      : super(request: request, response: response);

  factory SetAppointmentBody.fromMap(Map<String, dynamic> data) => SetAppointmentBody(
      response: data['SetAppointmentResponse'] != null
          ? SetAppointmentResponse.fromMap(data['SetAppointmentResponse'])
          : null,
      fault: data['Fault'] != null ? SoapFault.fromMap(data['Fault']) : null);

  SetAppointmentRequest? get setAppointmentRequest => request as SetAppointmentRequest?;

  SetAppointmentResponse? get setAppointmentResponse => response as SetAppointmentResponse?;

  @override
  Map<String, dynamic> toMap() => {
        if (request != null) 'SetAppointmentRequest': request!.toMap(),
      };
}
