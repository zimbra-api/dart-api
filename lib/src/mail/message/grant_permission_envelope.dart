// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_envelope.dart';
import 'package:zimbra_api/src/common/type/soap_header.dart';

import 'grant_permission_body.dart';

class GrantPermissionEnvelope extends SoapEnvelope {
  GrantPermissionEnvelope(GrantPermissionBody body, {super.header}) : super(body);

  factory GrantPermissionEnvelope.fromJson(Map<String, dynamic> json) =>
      GrantPermissionEnvelope(GrantPermissionBody.fromJson(json['Body']),
          header: json['Header'] != null ? SoapHeader.fromJson(json['Header']) : null);

  GrantPermissionBody get grantPermissionBody => body as GrantPermissionBody;
}
