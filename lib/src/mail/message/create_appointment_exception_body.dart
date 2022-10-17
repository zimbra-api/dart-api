// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_body.dart';
import 'package:zimbra_api/src/common/type/soap_fault.dart';

import 'create_appointment_exception_request.dart';
import 'create_appointment_exception_response.dart';

class CreateAppointmentExceptionBody extends SoapBody {
  CreateAppointmentExceptionBody(
      {CreateAppointmentExceptionRequest? request, CreateAppointmentExceptionResponse? response, super.fault})
      : super(request: request, response: response);

  factory CreateAppointmentExceptionBody.fromJson(Map<String, dynamic> json) => CreateAppointmentExceptionBody(
      response: json['CreateAppointmentExceptionResponse'] != null
          ? CreateAppointmentExceptionResponse.fromJson(json['CreateAppointmentExceptionResponse'])
          : null,
      fault: json['Fault'] != null ? SoapFault.fromJson(json['Fault']) : null);

  CreateAppointmentExceptionRequest? get createAppointmentExceptionRequest =>
      request as CreateAppointmentExceptionRequest?;

  CreateAppointmentExceptionResponse? get createAppointmentExceptionResponse =>
      response as CreateAppointmentExceptionResponse?;

  @override
  Map<String, dynamic> toJson() => {
        if (request != null) 'CreateAppointmentExceptionRequest': request!.toJson(),
      };
}
