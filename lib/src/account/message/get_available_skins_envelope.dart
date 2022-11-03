// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_envelope.dart';
import 'package:zimbra_api/src/common/type/soap_header.dart';

import 'get_available_skins_body.dart';

class GetAvailableSkinsEnvelope extends SoapEnvelope {
  GetAvailableSkinsEnvelope(GetAvailableSkinsBody body, {super.header}) : super(body);

  factory GetAvailableSkinsEnvelope.fromMap(Map<String, dynamic> data) =>
      GetAvailableSkinsEnvelope(GetAvailableSkinsBody.fromMap(data['Body']),
          header: data['Header'] != null ? SoapHeader.fromMap(data['Header']) : null);

  GetAvailableSkinsBody get getAvailableSkinsBody => body as GetAvailableSkinsBody;
}
