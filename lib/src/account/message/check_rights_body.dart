// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_body.dart';
import 'package:zimbra_api/src/common/type/soap_fault.dart';

import 'check_rights_request.dart';
import 'check_rights_response.dart';

class CheckRightsBody extends SoapBody {
  CheckRightsBody({CheckRightsRequest? request, CheckRightsResponse? response, super.fault})
      : super(request: request, response: response);

  factory CheckRightsBody.fromMap(Map<String, dynamic> data) => CheckRightsBody(
      response: data['CheckRightsResponse'] != null ? CheckRightsResponse.fromMap(data['CheckRightsResponse']) : null,
      fault: data['Fault'] != null ? SoapFault.fromMap(data['Fault']) : null);

  @override
  Map<String, dynamic> toMap() => {
        if (request != null) 'CheckRightsRequest': request!.toMap(),
      };
}
