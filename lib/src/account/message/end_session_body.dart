// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_body.dart';
import 'package:zimbra_api/src/common/type/soap_fault.dart';

import 'end_session_request.dart';
import 'end_session_response.dart';

class EndSessionBody extends SoapBody {
  EndSessionBody({EndSessionRequest? request, EndSessionResponse? response, super.fault})
      : super(request: request, response: response);

  factory EndSessionBody.fromMap(Map<String, dynamic> data) => EndSessionBody(
      response: data['EndSessionResponse'] != null ? EndSessionResponse.fromMap(data['EndSessionResponse']) : null,
      fault: data['Fault'] != null ? SoapFault.fromMap(data['Fault']) : null);

  @override
  Map<String, dynamic> toMap() => {
        if (request != null) 'EndSessionRequest': request!.toMap(),
      };
}
