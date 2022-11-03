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

  factory GrantRightsBody.fromMap(Map<String, dynamic> data) => GrantRightsBody(
      response: data['GrantRightsResponse'] != null ? GrantRightsResponse.fromMap(data['GrantRightsResponse']) : null,
      fault: data['Fault'] != null ? SoapFault.fromMap(data['Fault']) : null);

  GrantRightsRequest? get grantRightsRequest => request as GrantRightsRequest?;

  GrantRightsResponse? get grantRightsResponse => response as GrantRightsResponse?;

  @override
  Map<String, dynamic> toMap() => {
        if (request != null) 'GrantRightsRequest': request!.toMap(),
      };
}
