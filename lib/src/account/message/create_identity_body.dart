// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_body.dart';
import 'package:zimbra_api/src/common/type/soap_fault.dart';

import 'create_identity_request.dart';
import 'create_identity_response.dart';

class CreateIdentityBody extends SoapBody {
  CreateIdentityBody({CreateIdentityRequest? request, CreateIdentityResponse? response, super.fault})
      : super(request: request, response: response);

  factory CreateIdentityBody.fromMap(Map<String, dynamic> data) => CreateIdentityBody(
      response: data['CreateIdentityResponse'] != null
          ? CreateIdentityResponse.fromMap(data['CreateIdentityResponse'])
          : null,
      fault: data['Fault'] != null ? SoapFault.fromMap(data['Fault']) : null);

  CreateIdentityRequest? get createIdentityRequest => request as CreateIdentityRequest?;

  CreateIdentityResponse? get createIdentityResponse => response as CreateIdentityResponse?;

  @override
  Map<String, dynamic> toMap() => {
        if (request != null) 'CreateIdentityRequest': request!.toMap(),
      };
}
