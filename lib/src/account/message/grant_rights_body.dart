// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_body.dart';
import 'package:zimbra_api/src/common/type/soap_fault.dart';

import 'grant_rights_request.dart';
import 'grant_rights_response.dart';

class GrantRightsBody extends SoapBody {
  GrantRightsBody({GrantRightsRequest? request, GrantRightsResponse? response, super.fault})
      : super(request: request, response: response);

  factory GrantRightsBody.fromJson(Map<String, dynamic> json) => GrantRightsBody(
      response: json['GrantRightsResponse'] != null ? GrantRightsResponse.fromJson(json['GrantRightsResponse']) : null,
      fault: json['Fault'] != null ? SoapFault.fromJson(json['Fault']) : null);

  GrantRightsRequest? get grantRightsRequest => request as GrantRightsRequest?;

  GrantRightsResponse? get grantRightsResponse => response as GrantRightsResponse?;

  @override
  Map<String, dynamic> toJson() => {
        if (request != null) 'GrantRightsRequest': request!.toJson(),
      };
}
