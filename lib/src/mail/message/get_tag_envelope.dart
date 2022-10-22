// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_envelope.dart';
import 'package:zimbra_api/src/common/type/soap_header.dart';

import 'get_tag_body.dart';

class GetTagEnvelope extends SoapEnvelope {
  GetTagEnvelope(GetTagBody body, {super.header}) : super(body);

  factory GetTagEnvelope.fromJson(Map<String, dynamic> json) => GetTagEnvelope(GetTagBody.fromJson(json['Body']),
      header: json['Header'] != null ? SoapHeader.fromJson(json['Header']) : null);

  GetTagBody get getTagBody => body as GetTagBody;
}