// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_envelope.dart';
import 'package:zimbra_api/src/common/type/soap_header.dart';

import 'grant_permission_request.dart';
import 'revoke_permission_body.dart';
import 'revoke_permission_envelope.dart';

/// Revoke account level permissions
/// RevokePermissionResponse returns permissions that are successfully revoked.
/// Note: to be deprecated in Zimbra 9. Use zimbraAccount RevokeRights instead.
class RevokePermissionRequest extends GrantPermissionRequest {
  RevokePermissionRequest(super.aces);

  @override
  SoapEnvelope getEnvelope({SoapHeader? header}) =>
      RevokePermissionEnvelope(RevokePermissionBody(request: this), header: header);
}
