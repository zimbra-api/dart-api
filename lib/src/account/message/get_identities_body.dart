// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_body.dart';
import 'package:zimbra_api/src/common/type/soap_fault.dart';

import 'get_identities_request.dart';
import 'get_identities_response.dart';

class GetIdentitiesBody extends SoapBody {
  GetIdentitiesBody({GetIdentitiesRequest? request, GetIdentitiesResponse? response, super.fault})
      : super(request: request, response: response);

  factory GetIdentitiesBody.fromMap(Map<String, dynamic> data) => GetIdentitiesBody(
      response:
          data['GetIdentitiesResponse'] != null ? GetIdentitiesResponse.fromMap(data['GetIdentitiesResponse']) : null,
      fault: data['Fault'] != null ? SoapFault.fromMap(data['Fault']) : null);

  GetIdentitiesRequest? get getIdentitiesRequest => request as GetIdentitiesRequest?;

  GetIdentitiesResponse? get getIdentitiesResponse => response as GetIdentitiesResponse?;

  @override
  Map<String, dynamic> toMap() => {
        if (request != null) 'GetIdentitiesRequest': request!.toMap(),
      };
}
