// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/account/type/signature.dart';
import 'package:zimbra_api/src/common/type/soap_envelope.dart';
import 'package:zimbra_api/src/common/type/soap_header.dart';
import 'package:zimbra_api/src/common/type/soap_request.dart';

import 'create_signature_body.dart';
import 'create_signature_envelope.dart';

/// Create a signature.
/// If an id is provided it will be honored as the id for the signature.
/// CreateSignature will set account default signature to the signature being created if there is currently no default signature for the account.
/// There can be at most one text/plain signatue and one text/html signature.
class CreateSignatureRequest extends SoapRequest {
  /// Details of the signature to be created
  final Signature signature;

  CreateSignatureRequest(this.signature);

  @override
  SoapEnvelope getEnvelope({SoapHeader? header}) =>
      CreateSignatureEnvelope(CreateSignatureBody(request: this), header: header);

  @override
  Map<String, dynamic> toMap() => {
        '_jsns': 'urn:zimbraAccount',
        'signature': signature.toMap(),
      };
}
