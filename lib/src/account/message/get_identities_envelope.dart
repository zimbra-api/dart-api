// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_envelope.dart';
import 'package:zimbra_api/src/common/type/soap_header.dart';

import 'get_identities_body.dart';

class GetIdentitiesEnvelope extends SoapEnvelope {
  GetIdentitiesEnvelope(GetIdentitiesBody body, {SoapHeader? header}) : super(body, header: header);

  factory GetIdentitiesEnvelope.fromJson(Map<String, dynamic> json) =>
      GetIdentitiesEnvelope(GetIdentitiesBody.fromJson(json['Body']),
          header: json['Header'] != null ? SoapHeader.fromJson(json['Header']) : null);

  GetIdentitiesBody get getIdentitiesBody => body as GetIdentitiesBody;
}
