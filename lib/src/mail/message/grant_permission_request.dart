// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import '../../common/type/soap_header.dart';
import '../../common/type/soap_envelope.dart';
import '../../common/type/soap_request.dart';
import '../type/account_ace_info.dart';
import 'grant_permission_body.dart';
import 'grant_permission_envelope.dart';

/// Grant account level permissions
/// GrantPermissionResponse returns permissions that are successfully granted.
/// Note: to be deprecated in Zimbra 9.  Use zimbraAccount GrantRights instead.
class GrantPermissionRequest extends SoapRequest {
  /// Specify Access Control Entries (ACEs)
  final List<AccountACEinfo> aces;

  GrantPermissionRequest(this.aces);

  @override
  SoapEnvelope getEnvelope({SoapHeader? header}) => GrantPermissionEnvelope(
        GrantPermissionBody(request: this),
        header: header,
      );

  @override
  Map<String, dynamic> toMap() => {
        '_jsns': 'urn:zimbraMail',
        if (aces.isNotEmpty)
          'ace': aces
              .map(
                (ace) => ace.toMap(),
              )
              .toList(growable: false),
      };
}
