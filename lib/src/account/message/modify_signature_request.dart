// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/account/type/signature.dart';
import 'package:zimbra_api/src/common/type/soap_envelope.dart';
import 'package:zimbra_api/src/common/type/soap_request.dart';

import 'modify_signature_body.dart';
import 'modify_signature_envelope.dart';

/// Change attributes of the given signature.
/// Only the attributes specified in the request are modified.
/// Note:
/// The Server identifies the signature by id, if the name attribute is present
/// and is different from the current name of the signature, the signature will be renamed.
class ModifySignatureRequest extends SoapRequest {
  /// Specifies the changes to the signature
  final Signature signature;

  ModifySignatureRequest(this.signature);

  @override
  SoapEnvelope getEnvelope() => ModifySignatureEnvelope(ModifySignatureBody(request: this));

  @override
  Map<String, dynamic> toJson() => {
        '_jsns': 'urn:zimbraAccount',
        'signature': signature.toJson(),
      };
}
