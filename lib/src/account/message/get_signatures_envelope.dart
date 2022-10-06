// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_envelope.dart';
import 'package:zimbra_api/src/common/type/soap_header.dart';

import 'get_signatures_body.dart';

class GetSignaturesEnvelope extends SoapEnvelope {
  GetSignaturesEnvelope(GetSignaturesBody body, {SoapHeader? header}) : super(body, header: header);

  factory GetSignaturesEnvelope.fromJson(Map<String, dynamic> json) =>
      GetSignaturesEnvelope(GetSignaturesBody.fromJson(json['Body']),
          header: json['Header'] != null ? SoapHeader.fromJson(json['Header']) : null);

  GetSignaturesBody get getSignaturesBody => body as GetSignaturesBody;
}
