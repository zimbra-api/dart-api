// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_body.dart';
import 'package:zimbra_api/src/common/type/soap_fault.dart';

import 'save_document_request.dart';
import 'save_document_response.dart';

class SaveDocumentBody extends SoapBody {
  SaveDocumentBody({SaveDocumentRequest? request, SaveDocumentResponse? response, super.fault})
      : super(request: request, response: response);

  factory SaveDocumentBody.fromMap(Map<String, dynamic> data) => SaveDocumentBody(
      response:
          data['SaveDocumentResponse'] != null ? SaveDocumentResponse.fromMap(data['SaveDocumentResponse']) : null,
      fault: data['Fault'] != null ? SoapFault.fromMap(data['Fault']) : null);

  SaveDocumentRequest? get saveDocumentRequest => request as SaveDocumentRequest?;

  SaveDocumentResponse? get saveDocumentResponse => response as SaveDocumentResponse?;

  @override
  Map<String, dynamic> toMap() => {
        if (request != null) 'SaveDocumentRequest': request!.toMap(),
      };
}
