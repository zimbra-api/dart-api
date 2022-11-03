// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_body.dart';

import 'import_appointments_request.dart';
import 'import_appointments_response.dart';

class ImportAppointmentsBody extends SoapBody {
  ImportAppointmentsBody({ImportAppointmentsRequest? request, ImportAppointmentsResponse? response})
      : super(request: request, response: response);

  factory ImportAppointmentsBody.fromMap(Map<String, dynamic> data) => ImportAppointmentsBody(
      response: data['ImportAppointmentsResponse'] != null
          ? ImportAppointmentsResponse.fromMap(data['ImportAppointmentsResponse'])
          : null);

  @override
  Map<String, dynamic> toMap() => {
        if (request != null) 'ImportAppointmentsRequest': request!.toMap(),
      };
}
