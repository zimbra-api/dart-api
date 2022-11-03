// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_body.dart';
import 'package:zimbra_api/src/common/type/soap_fault.dart';

import 'create_signature_request.dart';
import 'create_signature_response.dart';

class CreateSignatureBody extends SoapBody {
  CreateSignatureBody({CreateSignatureRequest? request, CreateSignatureResponse? response, super.fault})
      : super(request: request, response: response);

  factory CreateSignatureBody.fromMap(Map<String, dynamic> data) => CreateSignatureBody(
      response: data['CreateSignatureResponse'] != null
          ? CreateSignatureResponse.fromMap(data['CreateSignatureResponse'])
          : null,
      fault: data['Fault'] != null ? SoapFault.fromMap(data['Fault']) : null);

  CreateSignatureRequest? get createSignatureRequest => request as CreateSignatureRequest?;

  CreateSignatureResponse? get createSignatureResponse => response as CreateSignatureResponse?;

  @override
  Map<String, dynamic> toMap() => {
        if (request != null) 'CreateSignatureRequest': request!.toMap(),
      };
}
