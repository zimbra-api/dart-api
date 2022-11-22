// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import '../../common/type/soap_envelope.dart';
import '../../common/type/soap_header.dart';
import '../../common/type/soap_request.dart';
import '../type/name_id.dart';
import 'delete_identity_body.dart';
import 'delete_identity_envelope.dart';

/// Delete an Identity
/// must specify either {name} or {id} attribute to <identity>
class DeleteIdentityRequest extends SoapRequest {
  /// Details of the identity to delete.
  final NameId identity;

  DeleteIdentityRequest(this.identity);

  @override
  SoapEnvelope getEnvelope({SoapHeader? header}) =>
      DeleteIdentityEnvelope(DeleteIdentityBody(request: this), header: header);

  @override
  Map<String, dynamic> toMap() => {
        '_jsns': 'urn:zimbraAccount',
        'identity': identity.toMap(),
      };
}
