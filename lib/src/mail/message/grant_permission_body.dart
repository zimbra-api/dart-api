// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_body.dart';
import 'package:zimbra_api/src/common/type/soap_fault.dart';

import 'grant_permission_request.dart';
import 'grant_permission_response.dart';

class GrantPermissionBody extends SoapBody {
  GrantPermissionBody({GrantPermissionRequest? request, GrantPermissionResponse? response, super.fault})
      : super(request: request, response: response);

  factory GrantPermissionBody.fromJson(Map<String, dynamic> json) => GrantPermissionBody(
      response: json['GrantPermissionResponse'] != null
          ? GrantPermissionResponse.fromJson(json['GrantPermissionResponse'])
          : null,
      fault: json['Fault'] != null ? SoapFault.fromJson(json['Fault']) : null);

  GrantPermissionRequest? get grantPermissionRequest => request as GrantPermissionRequest?;

  GrantPermissionResponse? get grantPermissionResponse => response as GrantPermissionResponse?;

  @override
  Map<String, dynamic> toJson() => {
        if (request != null) 'GrantPermissionRequest': request!.toJson(),
      };
}
