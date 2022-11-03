// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_body.dart';
import 'package:zimbra_api/src/common/type/soap_fault.dart';

import 'wait_set_request.dart';
import 'wait_set_response.dart';

class WaitSetBody extends SoapBody {
  WaitSetBody({WaitSetRequest? request, WaitSetResponse? response, super.fault})
      : super(request: request, response: response);

  factory WaitSetBody.fromMap(Map<String, dynamic> data) => WaitSetBody(
      response: data['WaitSetResponse'] != null ? WaitSetResponse.fromMap(data['WaitSetResponse']) : null,
      fault: data['Fault'] != null ? SoapFault.fromMap(data['Fault']) : null);

  WaitSetRequest? get waitSetRequest => request as WaitSetRequest?;

  WaitSetResponse? get waitSetResponse => response as WaitSetResponse?;

  @override
  Map<String, dynamic> toMap() => {
        if (request != null) 'WaitSetRequest': request!.toMap(),
      };
}
