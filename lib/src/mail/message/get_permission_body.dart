// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_body.dart';
import 'package:zimbra_api/src/common/type/soap_fault.dart';

import 'get_permission_request.dart';
import 'get_permission_response.dart';

class GetPermissionBody extends SoapBody {
  GetPermissionBody({GetPermissionRequest? request, GetPermissionResponse? response, super.fault})
      : super(request: request, response: response);

  factory GetPermissionBody.fromMap(Map<String, dynamic> data) => GetPermissionBody(
      response:
          data['GetPermissionResponse'] != null ? GetPermissionResponse.fromMap(data['GetPermissionResponse']) : null,
      fault: data['Fault'] != null ? SoapFault.fromMap(data['Fault']) : null);

  @override
  Map<String, dynamic> toMap() => {
        if (request != null) 'GetPermissionRequest': request!.toMap(),
      };
}
