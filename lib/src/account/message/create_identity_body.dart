// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_body.dart';
import 'package:zimbra_api/src/common/type/soap_fault.dart';

import 'create_identity_request.dart';
import 'create_identity_response.dart';

class CreateIdentityBody extends SoapBody {
  CreateIdentityBody({CreateIdentityRequest? request, CreateIdentityResponse? response, SoapFault? fault})
      : super(request: request, response: response, fault: fault);

  factory CreateIdentityBody.fromJson(Map<String, dynamic> json) => CreateIdentityBody(
      response: json['CreateIdentityResponse'] != null
          ? CreateIdentityResponse.fromJson(json['CreateIdentityResponse'])
          : null,
      fault: json['Fault'] != null ? SoapFault.fromJson(json['Fault']) : null);

  CreateIdentityRequest? get createIdentityRequest => request as CreateIdentityRequest;

  CreateIdentityResponse? get createIdentityResponse => response as CreateIdentityResponse;

  @override
  Map<String, dynamic> toJson() => {
        if (request != null) 'CreateIdentityRequest': request!.toJson(),
      };
}
