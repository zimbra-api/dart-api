// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import '../../common/type/soap_body.dart';
import 'create_wait_set_request.dart';
import 'create_wait_set_response.dart';

class CreateWaitSetBody extends SoapBody {
  CreateWaitSetBody({CreateWaitSetRequest? request, CreateWaitSetResponse? response})
      : super(request: request, response: response);

  factory CreateWaitSetBody.fromMap(Map<String, dynamic> data) => CreateWaitSetBody(
      response:
          data['CreateWaitSetResponse'] != null ? CreateWaitSetResponse.fromMap(data['CreateWaitSetResponse']) : null);

  @override
  Map<String, dynamic> toMap() => {
        if (request != null) 'CreateWaitSetRequest': request!.toMap(),
      };
}
