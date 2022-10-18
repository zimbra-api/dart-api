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

  factory CreateWaitSetBody.fromJson(Map<String, dynamic> json) => CreateWaitSetBody(
      response:
          json['CreateWaitSetResponse'] != null ? CreateWaitSetResponse.fromJson(json['CreateWaitSetResponse']) : null,
      fault: json['Fault'] != null ? SoapFault.fromJson(json['Fault']) : null);

  CreateWaitSetRequest? get createWaitSetRequest => request as CreateWaitSetRequest?;

  CreateWaitSetResponse? get createWaitSetResponse => response as CreateWaitSetResponse?;

  @override
  Map<String, dynamic> toJson() => {
        if (request != null) 'CreateWaitSetRequest': request!.toJson(),
      };
}
