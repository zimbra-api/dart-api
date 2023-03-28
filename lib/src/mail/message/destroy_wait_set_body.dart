// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import '../../common/type/soap_body.dart';
import 'destroy_wait_set_request.dart';
import 'destroy_wait_set_response.dart';

class DestroyWaitSetBody extends SoapBody {
  DestroyWaitSetBody({
    DestroyWaitSetRequest? request,
    DestroyWaitSetResponse? response,
  }) : super(request: request, response: response);

  factory DestroyWaitSetBody.fromMap(
    Map<String, dynamic> data,
  ) =>
      DestroyWaitSetBody(
        response: data['DestroyWaitSetResponse'] != null
            ? DestroyWaitSetResponse.fromMap(data['DestroyWaitSetResponse'])
            : null,
      );

  @override
  Map<String, dynamic> toMap() => {
        if (request != null) 'DestroyWaitSetRequest': request!.toMap(),
      };
}
