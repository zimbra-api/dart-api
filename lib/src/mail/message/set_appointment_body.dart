// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import '../../common/type/soap_body.dart';
import 'set_appointment_request.dart';
import 'set_appointment_response.dart';

class SetAppointmentBody extends SoapBody {
  SetAppointmentBody({
    SetAppointmentRequest? request,
    SetAppointmentResponse? response,
  }) : super(request: request, response: response);

  factory SetAppointmentBody.fromMap(
    Map<String, dynamic> data,
  ) =>
      SetAppointmentBody(
        response: data['SetAppointmentResponse'] != null
            ? SetAppointmentResponse.fromMap(
                data['SetAppointmentResponse'],
              )
            : null,
      );

  @override
  Map<String, dynamic> toMap() => {
        if (request != null) 'SetAppointmentRequest': request!.toMap(),
      };
}
