// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_body.dart';
import 'package:zimbra_api/src/common/type/soap_fault.dart';

import 'import_appointments_request.dart';
import 'import_appointments_response.dart';

class ImportAppointmentsBody extends SoapBody {
  ImportAppointmentsBody({ImportAppointmentsRequest? request, ImportAppointmentsResponse? response, super.fault})
      : super(request: request, response: response);

  factory ImportAppointmentsBody.fromJson(Map<String, dynamic> json) => ImportAppointmentsBody(
      response: json['ImportAppointmentsResponse'] != null
          ? ImportAppointmentsResponse.fromJson(json['ImportAppointmentsResponse'])
          : null,
      fault: json['Fault'] != null ? SoapFault.fromJson(json['Fault']) : null);

  ImportAppointmentsRequest? get importAppointmentsRequest => request as ImportAppointmentsRequest?;

  ImportAppointmentsResponse? get importAppointmentsResponse => response as ImportAppointmentsResponse?;

  @override
  Map<String, dynamic> toJson() => {
        if (request != null) 'ImportAppointmentsRequest': request!.toJson(),
      };
}
