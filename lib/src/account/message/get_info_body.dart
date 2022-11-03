// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_body.dart';
import 'package:zimbra_api/src/common/type/soap_fault.dart';

import 'get_info_request.dart';
import 'get_info_response.dart';

class GetInfoBody extends SoapBody {
  GetInfoBody({GetInfoRequest? request, GetInfoResponse? response, super.fault})
      : super(request: request, response: response);

  factory GetInfoBody.fromMap(Map<String, dynamic> data) => GetInfoBody(
      response: data['GetInfoResponse'] != null ? GetInfoResponse.fromMap(data['GetInfoResponse']) : null,
      fault: data['Fault'] != null ? SoapFault.fromMap(data['Fault']) : null);

  @override
  Map<String, dynamic> toMap() => {
        if (request != null) 'GetInfoRequest': request!.toMap(),
      };
}
