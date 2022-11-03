// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_header.dart';
import 'package:zimbra_api/src/common/type/soap_envelope.dart';
import 'package:zimbra_api/src/common/type/soap_request.dart';
import 'package:zimbra_api/src/mail/type/list_document_revisions_spec.dart';

import 'list_document_revisions_body.dart';
import 'list_document_revisions_envelope.dart';

/// Returns {num} number of revisions starting from {version} of the requested document.
/// {num} defaults to 1. {version} defaults to the current version.
/// Documents that have multiple revisions have the flag "/", which indicates that the document is versioned.
class ListDocumentRevisionsRequest extends SoapRequest {
  /// Specification for the list of document revisions
  final ListDocumentRevisionsSpec doc;

  ListDocumentRevisionsRequest(this.doc);

  @override
  SoapEnvelope getEnvelope({SoapHeader? header}) =>
      ListDocumentRevisionsEnvelope(ListDocumentRevisionsBody(request: this), header: header);

  @override
  Map<String, dynamic> toMap() => {
        '_jsns': 'urn:zimbraMail',
        'doc': doc.toMap(),
      };
}
