// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_body.dart';
import 'package:zimbra_api/src/common/type/soap_fault.dart';

import 'create_appointment_request.dart';
import 'create_appointment_response.dart';

class CreateAppointmentBody extends SoapBody {
  CreateAppointmentBody({CreateAppointmentRequest? request, CreateAppointmentResponse? response, super.fault})
      : super(request: request, response: response);

  factory CreateAppointmentBody.fromMap(Map<String, dynamic> data) => CreateAppointmentBody(
      response: data['CreateAppointmentResponse'] != null
          ? CreateAppointmentResponse.fromMap(data['CreateAppointmentResponse'])
          : null,
      fault: data['Fault'] != null ? SoapFault.fromMap(data['Fault']) : null);

  @override
  Map<String, dynamic> toMap() => {
        if (request != null) 'CreateAppointmentRequest': request!.toMap(),
      };
}
