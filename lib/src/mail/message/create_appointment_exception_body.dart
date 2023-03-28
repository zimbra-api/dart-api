// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import '../../common/type/soap_body.dart';
import 'create_appointment_exception_request.dart';
import 'create_appointment_exception_response.dart';

class CreateAppointmentExceptionBody extends SoapBody {
  CreateAppointmentExceptionBody({
    CreateAppointmentExceptionRequest? request,
    CreateAppointmentExceptionResponse? response,
  }) : super(request: request, response: response);

  factory CreateAppointmentExceptionBody.fromMap(
    Map<String, dynamic> data,
  ) =>
      CreateAppointmentExceptionBody(
        response: data['CreateAppointmentExceptionResponse'] != null
            ? CreateAppointmentExceptionResponse.fromMap(
                data['CreateAppointmentExceptionResponse'],
              )
            : null,
      );

  @override
  Map<String, dynamic> toMap() => {
        if (request != null) 'CreateAppointmentExceptionRequest': request!.toMap(),
      };
}
