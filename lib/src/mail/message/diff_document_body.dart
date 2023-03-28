// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import '../../common/type/soap_body.dart';
import 'diff_document_request.dart';
import 'diff_document_response.dart';

class DiffDocumentBody extends SoapBody {
  DiffDocumentBody({
    DiffDocumentRequest? request,
    DiffDocumentResponse? response,
  }) : super(request: request, response: response);

  factory DiffDocumentBody.fromMap(
    Map<String, dynamic> data,
  ) =>
      DiffDocumentBody(
        response: data['DiffDocumentResponse'] != null
            ? DiffDocumentResponse.fromMap(
                data['DiffDocumentResponse'],
              )
            : null,
      );

  @override
  Map<String, dynamic> toMap() => {
        if (request != null) 'DiffDocumentRequest': request!.toMap(),
      };
}
