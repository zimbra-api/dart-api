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

  factory CreateAppointmentBody.fromJson(Map<String, dynamic> json) => CreateAppointmentBody(
      response: json['CreateAppointmentResponse'] != null
          ? CreateAppointmentResponse.fromJson(json['CreateAppointmentResponse'])
          : null,
      fault: json['Fault'] != null ? SoapFault.fromJson(json['Fault']) : null);

  CreateAppointmentRequest? get createAppointmentRequest => request as CreateAppointmentRequest?;

  CreateAppointmentResponse? get createAppointmentResponse => response as CreateAppointmentResponse?;

  @override
  Map<String, dynamic> toJson() => {
        if (request != null) 'CreateAppointmentRequest': request!.toJson(),
      };
}
