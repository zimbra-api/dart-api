// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_body.dart';
import 'package:zimbra_api/src/common/type/soap_fault.dart';

import 'get_identities_request.dart';
import 'get_identities_response.dart';

class GetIdentitiesBody extends SoapBody {
  GetIdentitiesBody({GetIdentitiesRequest? request, GetIdentitiesResponse? response, SoapFault? fault})
      : super(request: request, response: response, fault: fault);

  factory GetIdentitiesBody.fromJson(Map<String, dynamic> json) => GetIdentitiesBody(
      response:
          json['GetIdentitiesResponse'] != null ? GetIdentitiesResponse.fromJson(json['GetIdentitiesResponse']) : null,
      fault: json['Fault'] != null ? SoapFault.fromJson(json['Fault']) : null);

  GetIdentitiesRequest? get getIdentitiesRequest => request as GetIdentitiesRequest;

  GetIdentitiesResponse? get getIdentitiesResponse => response as GetIdentitiesResponse;

  @override
  Map<String, dynamic> toJson() => {
        if (request != null) 'GetIdentitiesRequest': request!.toJson(),
      };
}
