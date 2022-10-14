// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_body.dart';
import 'package:zimbra_api/src/common/type/soap_fault.dart';

import 'check_permission_request.dart';
import 'check_permission_response.dart';

class CheckPermissionBody extends SoapBody {
  CheckPermissionBody({CheckPermissionRequest? request, CheckPermissionResponse? response, super.fault})
      : super(request: request, response: response);

  factory CheckPermissionBody.fromJson(Map<String, dynamic> json) => CheckPermissionBody(
      response: json['CheckPermissionResponse'] != null
          ? CheckPermissionResponse.fromJson(json['CheckPermissionResponse'])
          : null,
      fault: json['Fault'] != null ? SoapFault.fromJson(json['Fault']) : null);

  CheckPermissionRequest? get checkPermissionRequest => request as CheckPermissionRequest?;

  CheckPermissionResponse? get checkPermissionResponse => response as CheckPermissionResponse?;

  @override
  Map<String, dynamic> toJson() => {
        if (request != null) 'CheckPermissionRequest': request!.toJson(),
      };
}
