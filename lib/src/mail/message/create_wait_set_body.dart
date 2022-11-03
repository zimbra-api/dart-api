// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_body.dart';
import 'package:zimbra_api/src/common/type/soap_fault.dart';
import 'package:zimbra_api/src/mail/message/create_wait_set_response.dart';

import 'create_wait_set_request.dart';

class CreateWaitSetBody extends SoapBody {
  CreateWaitSetBody({CreateWaitSetRequest? request, CreateWaitSetResponse? response, super.fault})
      : super(request: request, response: response);

  factory CreateWaitSetBody.fromMap(Map<String, dynamic> data) => CreateWaitSetBody(
      response:
          data['CreateWaitSetResponse'] != null ? CreateWaitSetResponse.fromMap(data['CreateWaitSetResponse']) : null,
      fault: data['Fault'] != null ? SoapFault.fromMap(data['Fault']) : null);

  @override
  Map<String, dynamic> toMap() => {
        if (request != null) 'CreateWaitSetRequest': request!.toMap(),
      };
}
