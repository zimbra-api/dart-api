// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_envelope.dart';
import 'package:zimbra_api/src/common/type/soap_header.dart';

import 'get_free_busy_body.dart';

class GetFreeBusyEnvelope extends SoapEnvelope {
  GetFreeBusyEnvelope(GetFreeBusyBody body, {super.header}) : super(body);

  factory GetFreeBusyEnvelope.fromJson(Map<String, dynamic> json) =>
      GetFreeBusyEnvelope(GetFreeBusyBody.fromJson(json['Body']),
          header: json['Header'] != null ? SoapHeader.fromJson(json['Header']) : null);

  GetFreeBusyBody get getFreeBusyBody => body as GetFreeBusyBody;
}
