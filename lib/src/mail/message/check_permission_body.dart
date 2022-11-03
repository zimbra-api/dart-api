// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_body.dart';

import 'check_permission_request.dart';
import 'check_permission_response.dart';

class CheckPermissionBody extends SoapBody {
  CheckPermissionBody({CheckPermissionRequest? request, CheckPermissionResponse? response})
      : super(request: request, response: response);

  factory CheckPermissionBody.fromMap(Map<String, dynamic> data) => CheckPermissionBody(
      response: data['CheckPermissionResponse'] != null
          ? CheckPermissionResponse.fromMap(data['CheckPermissionResponse'])
          : null);

  @override
  Map<String, dynamic> toMap() => {
        if (request != null) 'CheckPermissionRequest': request!.toMap(),
      };
}
