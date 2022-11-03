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

  factory RevokePermissionBody.fromMap(Map<String, dynamic> data) => RevokePermissionBody(
      response: data['RevokePermissionResponse'] != null
          ? RevokePermissionResponse.fromMap(data['RevokePermissionResponse'])
          : null,
      fault: data['Fault'] != null ? SoapFault.fromMap(data['Fault']) : null);

  @override
  Map<String, dynamic> toMap() => {
        if (request != null) 'RevokePermissionRequest': request!.toMap(),
      };
}
