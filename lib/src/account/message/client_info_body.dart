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

  factory ClientInfoBody.fromJson(Map<String, dynamic> json) => ClientInfoBody(
      response: json['ClientInfoResponse'] != null ? ClientInfoResponse.fromJson(json['ClientInfoResponse']) : null,
      fault: json['Fault'] != null ? SoapFault.fromJson(json['Fault']) : null);

  ClientInfoRequest? get clientInfoRequest => request as ClientInfoRequest?;

  ClientInfoResponse? get clientInfoResponse => response as ClientInfoResponse?;

  @override
  Map<String, dynamic> toJson() => {
        if (request != null) 'ClientInfoRequest': request!.toJson(),
      };
}
