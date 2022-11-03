// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_body.dart';
import 'package:zimbra_api/src/common/type/soap_fault.dart';

import 'client_info_request.dart';
import 'client_info_response.dart';

class ClientInfoBody extends SoapBody {
  ClientInfoBody({ClientInfoRequest? request, ClientInfoResponse? response, super.fault})
      : super(request: request, response: response);

  factory ClientInfoBody.fromMap(Map<String, dynamic> data) => ClientInfoBody(
      response: data['ClientInfoResponse'] != null ? ClientInfoResponse.fromMap(data['ClientInfoResponse']) : null,
      fault: data['Fault'] != null ? SoapFault.fromMap(data['Fault']) : null);

  @override
  Map<String, dynamic> toMap() => {
        if (request != null) 'ClientInfoRequest': request!.toMap(),
      };
}
