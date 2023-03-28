// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import '../../common/type/soap_body.dart';
import 'grant_permission_request.dart';
import 'grant_permission_response.dart';

class GrantPermissionBody extends SoapBody {
  GrantPermissionBody({
    GrantPermissionRequest? request,
    GrantPermissionResponse? response,
  }) : super(request: request, response: response);

  factory GrantPermissionBody.fromMap(
    Map<String, dynamic> data,
  ) =>
      GrantPermissionBody(
        response: data['GrantPermissionResponse'] != null
            ? GrantPermissionResponse.fromMap(
                data['GrantPermissionResponse'],
              )
            : null,
      );

  @override
  Map<String, dynamic> toMap() => {
        if (request != null) 'GrantPermissionRequest': request!.toMap(),
      };
}
