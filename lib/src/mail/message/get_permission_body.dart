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

  factory GetPermissionBody.fromJson(Map<String, dynamic> json) => GetPermissionBody(
      response:
          json['GetPermissionResponse'] != null ? GetPermissionResponse.fromJson(json['GetPermissionResponse']) : null,
      fault: json['Fault'] != null ? SoapFault.fromJson(json['Fault']) : null);

  GetPermissionRequest? get getPermissionRequest => request as GetPermissionRequest?;

  GetPermissionResponse? get getPermissionResponse => response as GetPermissionResponse?;

  @override
  Map<String, dynamic> toJson() => {
        if (request != null) 'GetPermissionRequest': request!.toJson(),
      };
}
