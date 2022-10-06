// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_body.dart';
import 'package:zimbra_api/src/common/type/soap_fault.dart';

import 'modify_signature_request.dart';
import 'modify_signature_response.dart';

class ModifySignatureBody extends SoapBody {
  ModifySignatureBody({ModifySignatureRequest? request, ModifySignatureResponse? response, super.fault})
      : super(request: request, response: response);

  factory ModifySignatureBody.fromJson(Map<String, dynamic> json) => ModifySignatureBody(
      response: json['ModifySignatureResponse'] != null
          ? ModifySignatureResponse.fromJson(json['ModifySignatureResponse'])
          : null,
      fault: json['Fault'] != null ? SoapFault.fromJson(json['Fault']) : null);

  ModifySignatureRequest? get modifySignatureRequest => request as ModifySignatureRequest;

  ModifySignatureResponse? get modifySignatureResponse => response as ModifySignatureResponse;

  @override
  Map<String, dynamic> toJson() => {
        if (request != null) 'ModifySignatureRequest': request!.toJson(),
      };
}
