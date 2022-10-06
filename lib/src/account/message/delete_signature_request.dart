// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/account/type/name_id.dart';
import 'package:zimbra_api/src/common/type/soap_envelope.dart';
import 'package:zimbra_api/src/common/type/soap_request.dart';

import 'delete_signature_body.dart';
import 'delete_signature_envelope.dart';

/// Delete a signature
/// must specify either {name} or {id} attribute to <signature>
class DeleteSignatureRequest extends SoapRequest {
  /// The signature to delete
  final NameId signature;

  DeleteSignatureRequest(this.signature);

  @override
  SoapEnvelope getEnvelope() => DeleteSignatureEnvelope(DeleteSignatureBody(request: this));

  @override
  Map<String, dynamic> toJson() => {
        '_jsns': 'urn:zimbraAccount',
        'signature': signature.toJson(),
      };
}
