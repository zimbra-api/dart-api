// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_header.dart';
import 'package:zimbra_api/src/common/type/soap_envelope.dart';
import 'package:zimbra_api/src/common/type/soap_request.dart';
import 'package:zimbra_api/src/mail/type/diff_document_version_spec.dart';

import 'diff_document_body.dart';
import 'diff_document_envelope.dart';

/// Performs line by line diff of two revisions of a Document then returns a list of <chunk> containing the result.
/// Sections of text that are identical to both versions are indicated with disp="common".
/// For each conflict the chunk will show disp="first", disp="second" or both.
class DiffDocumentRequest extends SoapRequest {
  /// Diff document version specification
  final DiffDocumentVersionSpec doc;

  DiffDocumentRequest(this.doc);

  @override
  SoapEnvelope getEnvelope({SoapHeader? header}) =>
      DiffDocumentEnvelope(DiffDocumentBody(request: this), header: header);

  @override
  Map<String, dynamic> toMap() => {
        '_jsns': 'urn:zimbraMail',
        'doc': doc.toMap(),
      };
}
