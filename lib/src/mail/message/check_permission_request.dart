// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_header.dart';
import 'package:zimbra_api/src/common/type/soap_envelope.dart';
import 'package:zimbra_api/src/common/type/soap_request.dart';
import 'package:zimbra_api/src/mail/type/target_spec.dart';

import 'check_permission_body.dart';
import 'check_permission_envelope.dart';

/// Check if the authed user has the specified right(s) on a target.
/// Note: to be deprecated in Zimbra 9.  Use zimbraAccount CheckRights instead.
class CheckPermissionRequest extends SoapRequest {
  /// Target specification
  final TargetSpec target;

  /// Rights to check
  final List<String> rights;

  CheckPermissionRequest(this.target, {this.rights = const []});

  @override
  SoapEnvelope getEnvelope({SoapHeader? header}) =>
      CheckPermissionEnvelope(CheckPermissionBody(request: this), header: header);

  @override
  Map<String, dynamic> toMap() => {
        '_jsns': 'urn:zimbraMail',
        'target': target.toMap(),
        if (rights.isNotEmpty) 'right': rights.map((right) => {'_content': right}).toList(growable: false),
      };
}
