// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_envelope.dart';
import 'package:zimbra_api/src/common/type/soap_header.dart';

import 'revoke_rights_body.dart';

class RevokeRightsEnvelope extends SoapEnvelope {
  RevokeRightsEnvelope(RevokeRightsBody body, {super.header}) : super(body);

  factory RevokeRightsEnvelope.fromMap(Map<String, dynamic> data) =>
      RevokeRightsEnvelope(RevokeRightsBody.fromMap(data['Body']),
          header: data['Header'] != null ? SoapHeader.fromMap(data['Header']) : null);

  RevokeRightsBody get revokeRightsBody => body as RevokeRightsBody;
}
