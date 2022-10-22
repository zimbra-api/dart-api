// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_envelope.dart';
import 'package:zimbra_api/src/common/type/soap_header.dart';

import 'get_permission_body.dart';

class GetPermissionEnvelope extends SoapEnvelope {
  GetPermissionEnvelope(GetPermissionBody body, {super.header}) : super(body);

  factory GetPermissionEnvelope.fromJson(Map<String, dynamic> json) =>
      GetPermissionEnvelope(GetPermissionBody.fromJson(json['Body']),
          header: json['Header'] != null ? SoapHeader.fromJson(json['Header']) : null);

  GetPermissionBody get getPermissionBody => body as GetPermissionBody;
}