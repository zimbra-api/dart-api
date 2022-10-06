// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_envelope.dart';
import 'package:zimbra_api/src/common/type/soap_header.dart';

import 'get_prefs_body.dart';

class GetPrefsEnvelope extends SoapEnvelope {
  GetPrefsEnvelope(GetPrefsBody body, {super.header}) : super(body);

  factory GetPrefsEnvelope.fromJson(Map<String, dynamic> json) => GetPrefsEnvelope(GetPrefsBody.fromJson(json['Body']),
      header: json['Header'] != null ? SoapHeader.fromJson(json['Header']) : null);

  GetPrefsBody get getPrefsBody => body as GetPrefsBody;
}
