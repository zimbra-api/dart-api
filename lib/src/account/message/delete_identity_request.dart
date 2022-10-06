// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/account/type/name_id.dart';
import 'package:zimbra_api/src/common/type/soap_envelope.dart';
import 'package:zimbra_api/src/common/type/soap_request.dart';

import 'delete_identity_body.dart';
import 'delete_identity_envelope.dart';

/// Delete an Identity
/// must specify either {name} or {id} attribute to <identity>
class DeleteIdentityRequest extends SoapRequest {
  /// Details of the identity to delete.
  final NameId identity;

  DeleteIdentityRequest(this.identity);

  @override
  SoapEnvelope getEnvelope() => DeleteIdentityEnvelope(DeleteIdentityBody(request: this));

  @override
  Map<String, dynamic> toJson() => {
        '_jsns': 'urn:zimbraAccount',
        'identity': identity.toJson(),
      };
}
