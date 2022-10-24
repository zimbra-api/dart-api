// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_envelope.dart';
import 'package:zimbra_api/src/common/type/soap_header.dart';

import 'revoke_permission_body.dart';

class RevokePermissionEnvelope extends SoapEnvelope {
  RevokePermissionEnvelope(RevokePermissionBody body, {super.header}) : super(body);

  factory RevokePermissionEnvelope.fromJson(Map<String, dynamic> json) =>
      RevokePermissionEnvelope(RevokePermissionBody.fromJson(json['Body']),
          header: json['Header'] != null ? SoapHeader.fromJson(json['Header']) : null);

  RevokePermissionBody get revokePermissionBody => body as RevokePermissionBody;
}
