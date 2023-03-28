// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import '../../common/type/soap_body.dart';
import 'wait_set_request.dart';
import 'wait_set_response.dart';

class WaitSetBody extends SoapBody {
  WaitSetBody({
    WaitSetRequest? request,
    WaitSetResponse? response,
  }) : super(request: request, response: response);

  factory WaitSetBody.fromMap(Map<String, dynamic> data) => WaitSetBody(
        response: data['WaitSetResponse'] != null
            ? WaitSetResponse.fromMap(
                data['WaitSetResponse'],
              )
            : null,
      );

  @override
  Map<String, dynamic> toMap() => {
        if (request != null) 'WaitSetRequest': request!.toMap(),
      };
}
