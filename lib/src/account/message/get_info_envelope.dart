// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_envelope.dart';
import 'package:zimbra_api/src/common/type/soap_header.dart';

import 'get_info_body.dart';

class GetInfoEnvelope extends SoapEnvelope {
  GetInfoEnvelope(GetInfoBody body, {super.header}) : super(body..response?.header = header);

  factory GetInfoEnvelope.fromMap(Map<String, dynamic> data) => GetInfoEnvelope(GetInfoBody.fromMap(data['Body']),
      header: data['Header'] != null ? SoapHeader.fromMap(data['Header']) : null);

  GetInfoBody get getInfoBody => body as GetInfoBody;
}
