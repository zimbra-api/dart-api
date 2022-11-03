// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_body.dart';
import 'package:zimbra_api/src/common/type/soap_fault.dart';

import 'destroy_wait_set_request.dart';
import 'destroy_wait_set_response.dart';

class DestroyWaitSetBody extends SoapBody {
  DestroyWaitSetBody({DestroyWaitSetRequest? request, DestroyWaitSetResponse? response, super.fault})
      : super(request: request, response: response);

  factory DestroyWaitSetBody.fromMap(Map<String, dynamic> data) => DestroyWaitSetBody(
      response: data['DestroyWaitSetResponse'] != null
          ? DestroyWaitSetResponse.fromMap(data['DestroyWaitSetResponse'])
          : null,
      fault: data['Fault'] != null ? SoapFault.fromMap(data['Fault']) : null);

  DestroyWaitSetRequest? get destroyWaitSetRequest => request as DestroyWaitSetRequest?;

  DestroyWaitSetResponse? get destroyWaitSetResponse => response as DestroyWaitSetResponse?;

  @override
  Map<String, dynamic> toMap() => {
        if (request != null) 'DestroyWaitSetRequest': request!.toMap(),
      };
}
