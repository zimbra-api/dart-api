// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_body.dart';
import 'package:zimbra_api/src/common/type/soap_fault.dart';

import 'get_free_busy_request.dart';
import 'get_free_busy_response.dart';

class GetFreeBusyBody extends SoapBody {
  GetFreeBusyBody({GetFreeBusyRequest? request, GetFreeBusyResponse? response, super.fault})
      : super(request: request, response: response);

  factory GetFreeBusyBody.fromMap(Map<String, dynamic> data) => GetFreeBusyBody(
      response: data['GetFreeBusyResponse'] != null ? GetFreeBusyResponse.fromMap(data['GetFreeBusyResponse']) : null,
      fault: data['Fault'] != null ? SoapFault.fromMap(data['Fault']) : null);

  GetFreeBusyRequest? get getFreeBusyRequest => request as GetFreeBusyRequest?;

  GetFreeBusyResponse? get getFreeBusyResponse => response as GetFreeBusyResponse?;

  @override
  Map<String, dynamic> toMap() => {
        if (request != null) 'GetFreeBusyRequest': request!.toMap(),
      };
}
