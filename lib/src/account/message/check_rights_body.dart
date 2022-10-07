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

  factory CheckRightsBody.fromJson(Map<String, dynamic> json) => CheckRightsBody(
      response: json['CheckRightsResponse'] != null ? CheckRightsResponse.fromJson(json['CheckRightsResponse']) : null,
      fault: json['Fault'] != null ? SoapFault.fromJson(json['Fault']) : null);

  CheckRightsRequest? get checkRightsRequest => request as CheckRightsRequest?;

  CheckRightsResponse? get checkRightsResponse => response as CheckRightsResponse?;

  @override
  Map<String, dynamic> toJson() => {
        if (request != null) 'CheckRightsRequest': request!.toJson(),
      };
}
