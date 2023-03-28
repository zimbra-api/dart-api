// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import '../../common/type/soap_body.dart';
import 'list_document_revisions_request.dart';
import 'list_document_revisions_response.dart';

class ListDocumentRevisionsBody extends SoapBody {
  ListDocumentRevisionsBody({
    ListDocumentRevisionsRequest? request,
    ListDocumentRevisionsResponse? response,
  }) : super(request: request, response: response);

  factory ListDocumentRevisionsBody.fromMap(
    Map<String, dynamic> data,
  ) =>
      ListDocumentRevisionsBody(
        response: data['ListDocumentRevisionsResponse'] != null
            ? ListDocumentRevisionsResponse.fromMap(
                data['ListDocumentRevisionsResponse'],
              )
            : null,
      );

  @override
  Map<String, dynamic> toMap() => {
        if (request != null) 'ListDocumentRevisionsRequest': request!.toMap(),
      };
}
