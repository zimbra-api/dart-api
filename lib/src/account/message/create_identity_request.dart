// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/account/type/identity.dart';
import 'package:zimbra_api/src/common/type/soap_envelope.dart';
import 'package:zimbra_api/src/common/type/soap_request.dart';

import 'create_identity_body.dart';
import 'create_identity_envelope.dart';

/// Create an Identity
/// Notes: Allowed attributes (see objectclass zimbraIdentity in zimbra.schema)
class CreateIdentityRequest extends SoapRequest {
  /// Details of the new identity to create
  final Identity identity;

  CreateIdentityRequest(this.identity);

  @override
  SoapEnvelope getEnvelope() => CreateIdentityEnvelope(CreateIdentityBody(request: this));

  @override
  Map<String, dynamic> toJson() => {
        '_jsns': 'urn:zimbraAccount',
        'identity': identity.toJson(),
      };
}
