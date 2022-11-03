// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_envelope.dart';
import 'package:zimbra_api/src/common/type/soap_header.dart';

import 'get_rights_body.dart';

class GetRightsEnvelope extends SoapEnvelope {
  GetRightsEnvelope(GetRightsBody body, {super.header}) : super(body..response?.header = header);

  factory GetRightsEnvelope.fromMap(Map<String, dynamic> data) =>
      GetRightsEnvelope(GetRightsBody.fromMap(data['Body']),
          header: data['Header'] != null ? SoapHeader.fromMap(data['Header']) : null);

  GetRightsBody get getRightsBody => body as GetRightsBody;
}
