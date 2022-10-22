// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_body.dart';
import 'package:zimbra_api/src/common/type/soap_fault.dart';

import 'list_document_revisions_request.dart';
import 'list_document_revisions_response.dart';

class ListDocumentRevisionsBody extends SoapBody {
  ListDocumentRevisionsBody(
      {ListDocumentRevisionsRequest? request, ListDocumentRevisionsResponse? response, super.fault})
      : super(request: request, response: response);

  factory ListDocumentRevisionsBody.fromJson(Map<String, dynamic> json) => ListDocumentRevisionsBody(
      response: json['ListDocumentRevisionsResponse'] != null
          ? ListDocumentRevisionsResponse.fromJson(json['ListDocumentRevisionsResponse'])
          : null,
      fault: json['Fault'] != null ? SoapFault.fromJson(json['Fault']) : null);

  ListDocumentRevisionsRequest? get listDocumentRevisionsRequest => request as ListDocumentRevisionsRequest?;

  ListDocumentRevisionsResponse? get listDocumentRevisionsResponse => response as ListDocumentRevisionsResponse?;

  @override
  Map<String, dynamic> toJson() => {
        if (request != null) 'ListDocumentRevisionsRequest': request!.toJson(),
      };
}
