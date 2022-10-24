// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_body.dart';
import 'package:zimbra_api/src/common/type/soap_fault.dart';

import 'revoke_permission_request.dart';
import 'revoke_permission_response.dart';

class RevokePermissionBody extends SoapBody {
  RevokePermissionBody({RevokePermissionRequest? request, RevokePermissionResponse? response, super.fault})
      : super(request: request, response: response);

  factory RevokePermissionBody.fromJson(Map<String, dynamic> json) => RevokePermissionBody(
      response: json['RevokePermissionResponse'] != null
          ? RevokePermissionResponse.fromJson(json['RevokePermissionResponse'])
          : null,
      fault: json['Fault'] != null ? SoapFault.fromJson(json['Fault']) : null);

  RevokePermissionRequest? get revokePermissionRequest => request as RevokePermissionRequest?;

  RevokePermissionResponse? get revokePermissionResponse => response as RevokePermissionResponse?;

  @override
  Map<String, dynamic> toJson() => {
        if (request != null) 'RevokePermissionRequest': request!.toJson(),
      };
}
