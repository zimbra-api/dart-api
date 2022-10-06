// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_envelope.dart';
import 'package:zimbra_api/src/common/type/soap_header.dart';

import 'get_version_info_body.dart';

class GetVersionInfoEnvelope extends SoapEnvelope {
  GetVersionInfoEnvelope(GetVersionInfoBody body, {super.header}) : super(body);

  factory GetVersionInfoEnvelope.fromJson(Map<String, dynamic> json) =>
      GetVersionInfoEnvelope(GetVersionInfoBody.fromJson(json['Body']),
          header: json['Header'] != null ? SoapHeader.fromJson(json['Header']) : null);

  GetVersionInfoBody get getVersionInfoBody => body as GetVersionInfoBody;
}
