// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_body.dart';
import 'package:zimbra_api/src/common/type/soap_fault.dart';

import 'create_signature_request.dart';
import 'create_signature_response.dart';

class CreateSignatureBody extends SoapBody {
  CreateSignatureBody({CreateSignatureRequest? request, CreateSignatureResponse? response, SoapFault? fault})
      : super(request: request, response: response, fault: fault);

  factory CreateSignatureBody.fromJson(Map<String, dynamic> json) => CreateSignatureBody(
      response: json['CreateSignatureResponse'] != null
          ? CreateSignatureResponse.fromJson(json['CreateSignatureResponse'])
          : null,
      fault: json['Fault'] != null ? SoapFault.fromJson(json['Fault']) : null);

  CreateSignatureRequest? get createSignatureRequest => request as CreateSignatureRequest;

  CreateSignatureResponse? get createSignatureResponse => response as CreateSignatureResponse;

  @override
  Map<String, dynamic> toJson() => {
        if (request != null) 'CreateSignatureRequest': request!.toJson(),
      };
}
