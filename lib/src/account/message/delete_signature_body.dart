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

  factory DeleteSignatureBody.fromMap(Map<String, dynamic> data) => DeleteSignatureBody(
      response: data['DeleteSignatureResponse'] != null
          ? DeleteSignatureResponse.fromMap(data['DeleteSignatureResponse'])
          : null,
      fault: data['Fault'] != null ? SoapFault.fromMap(data['Fault']) : null);

  DeleteSignatureRequest? get deleteSignatureRequest => request as DeleteSignatureRequest?;

  DeleteSignatureResponse? get deleteSignatureResponse => response as DeleteSignatureResponse?;

  @override
  Map<String, dynamic> toMap() => {
        if (request != null) 'DeleteSignatureRequest': request!.toMap(),
      };
}
