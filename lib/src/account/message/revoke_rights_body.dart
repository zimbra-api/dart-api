// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_body.dart';
import 'package:zimbra_api/src/common/type/soap_fault.dart';

import 'revoke_rights_request.dart';
import 'revoke_rights_response.dart';

class RevokeRightsBody extends SoapBody {
  RevokeRightsBody({RevokeRightsRequest? request, RevokeRightsResponse? response, SoapFault? fault})
      : super(request: request, response: response, fault: fault);

  factory RevokeRightsBody.fromJson(Map<String, dynamic> json) => RevokeRightsBody(
      response:
          json['RevokeRightsResponse'] != null ? RevokeRightsResponse.fromJson(json['RevokeRightsResponse']) : null,
      fault: json['Fault'] != null ? SoapFault.fromJson(json['Fault']) : null);

  RevokeRightsRequest? get revokeRightsRequest => request as RevokeRightsRequest;

  RevokeRightsResponse? get revokeRightsResponse => response as RevokeRightsResponse;

  @override
  Map<String, dynamic> toJson() => {
        if (request != null) 'RevokeRightsRequest': request!.toJson(),
      };
}
