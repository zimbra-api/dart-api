// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_envelope.dart';
import 'package:zimbra_api/src/common/type/soap_header.dart';

import 'get_available_locales_body.dart';

class GetAvailableLocalesEnvelope extends SoapEnvelope {
  GetAvailableLocalesEnvelope(GetAvailableLocalesBody body, {SoapHeader? header}) : super(body, header: header);

  factory GetAvailableLocalesEnvelope.fromJson(Map<String, dynamic> json) =>
      GetAvailableLocalesEnvelope(GetAvailableLocalesBody.fromJson(json['Body']),
          header: json['Header'] != null ? SoapHeader.fromJson(json['Header']) : null);

  GetAvailableLocalesBody get getAvailableLocalesBody => body as GetAvailableLocalesBody;
}
