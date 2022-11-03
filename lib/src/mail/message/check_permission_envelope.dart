// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_envelope.dart';
import 'package:zimbra_api/src/common/type/soap_header.dart';

import 'check_permission_body.dart';

class CheckPermissionEnvelope extends SoapEnvelope {
  CheckPermissionEnvelope(CheckPermissionBody body, {super.header}) : super(body);

  factory CheckPermissionEnvelope.fromMap(Map<String, dynamic> data) =>
      CheckPermissionEnvelope(CheckPermissionBody.fromMap(data['Body']),
          header: data['Header'] != null ? SoapHeader.fromMap(data['Header']) : null);

  CheckPermissionBody get checkPermissionBody => body as CheckPermissionBody;
}
