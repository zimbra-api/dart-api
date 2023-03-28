// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import '../../common/type/soap_envelope.dart';
import '../../common/type/soap_header.dart';
import '../../common/type/soap_request.dart';
import '../type/name_id.dart';
import 'delete_signature_body.dart';
import 'delete_signature_envelope.dart';

/// Delete a signature
/// must specify either {name} or {id} attribute to <signature>
class DeleteSignatureRequest extends SoapRequest {
  /// The signature to delete
  final NameId signature;

  DeleteSignatureRequest(this.signature);

  @override
  SoapEnvelope getEnvelope({SoapHeader? header}) => DeleteSignatureEnvelope(
        DeleteSignatureBody(request: this),
        header: header,
      );

  @override
  Map<String, dynamic> toMap() => {
        '_jsns': 'urn:zimbraAccount',
        'signature': signature.toMap(),
      };
}
