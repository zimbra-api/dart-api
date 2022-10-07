// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_body.dart';
import 'package:zimbra_api/src/common/type/soap_fault.dart';

import 'delete_signature_request.dart';
import 'delete_signature_response.dart';

class DeleteSignatureBody extends SoapBody {
  DeleteSignatureBody({DeleteSignatureRequest? request, DeleteSignatureResponse? response, super.fault})
      : super(request: request, response: response);

  factory DeleteSignatureBody.fromJson(Map<String, dynamic> json) => DeleteSignatureBody(
      response: json['DeleteSignatureResponse'] != null
          ? DeleteSignatureResponse.fromJson(json['DeleteSignatureResponse'])
          : null,
      fault: json['Fault'] != null ? SoapFault.fromJson(json['Fault']) : null);

  DeleteSignatureRequest? get deleteSignatureRequest => request as DeleteSignatureRequest?;

  DeleteSignatureResponse? get deleteSignatureResponse => response as DeleteSignatureResponse?;

  @override
  Map<String, dynamic> toJson() => {
        if (request != null) 'DeleteSignatureRequest': request!.toJson(),
      };
}
