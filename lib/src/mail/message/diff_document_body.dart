// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_body.dart';
import 'package:zimbra_api/src/common/type/soap_fault.dart';

import 'diff_document_request.dart';
import 'diff_document_response.dart';

class DiffDocumentBody extends SoapBody {
  DiffDocumentBody({DiffDocumentRequest? request, DiffDocumentResponse? response, super.fault})
      : super(request: request, response: response);

  factory DiffDocumentBody.fromJson(Map<String, dynamic> json) => DiffDocumentBody(
      response:
          json['DiffDocumentResponse'] != null ? DiffDocumentResponse.fromJson(json['DiffDocumentResponse']) : null,
      fault: json['Fault'] != null ? SoapFault.fromJson(json['Fault']) : null);

  DiffDocumentRequest? get diffDocumentRequest => request as DiffDocumentRequest?;

  DiffDocumentResponse? get diffDocumentResponse => response as DiffDocumentResponse?;

  @override
  Map<String, dynamic> toJson() => {
        if (request != null) 'DiffDocumentRequest': request!.toJson(),
      };
}
