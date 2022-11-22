// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import '../../common/type/soap_body.dart';
import 'get_appointment_request.dart';
import 'get_appointment_response.dart';

class GetAppointmentBody extends SoapBody {
  GetAppointmentBody({GetAppointmentRequest? request, GetAppointmentResponse? response})
      : super(request: request, response: response);

  factory GetAppointmentBody.fromMap(Map<String, dynamic> data) => GetAppointmentBody(
      response: data['GetAppointmentResponse'] != null
          ? GetAppointmentResponse.fromMap(data['GetAppointmentResponse'])
          : null);

  @override
  Map<String, dynamic> toMap() => {
        if (request != null) 'GetAppointmentRequest': request!.toMap(),
      };
}
