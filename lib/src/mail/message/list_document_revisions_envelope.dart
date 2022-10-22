// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_envelope.dart';
import 'package:zimbra_api/src/common/type/soap_header.dart';

import 'list_document_revisions_body.dart';

class ListDocumentRevisionsEnvelope extends SoapEnvelope {
  ListDocumentRevisionsEnvelope(ListDocumentRevisionsBody body, {super.header}) : super(body);

  factory ListDocumentRevisionsEnvelope.fromJson(Map<String, dynamic> json) =>
      ListDocumentRevisionsEnvelope(ListDocumentRevisionsBody.fromJson(json['Body']),
          header: json['Header'] != null ? SoapHeader.fromJson(json['Header']) : null);

  ListDocumentRevisionsBody get listDocumentRevisionsBody => body as ListDocumentRevisionsBody;
}
