// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_envelope.dart';
import 'package:zimbra_api/src/common/type/soap_header.dart';

import 'get_all_locales_body.dart';

class GetAllLocalesEnvelope extends SoapEnvelope {
  GetAllLocalesEnvelope(GetAllLocalesBody body, {super.header}) : super(body..response?.header = header);

  factory GetAllLocalesEnvelope.fromMap(Map<String, dynamic> data) =>
      GetAllLocalesEnvelope(GetAllLocalesBody.fromMap(data['Body']),
          header: data['Header'] != null ? SoapHeader.fromMap(data['Header']) : null);

  GetAllLocalesBody get getAllLocalesBody => body as GetAllLocalesBody;
}
