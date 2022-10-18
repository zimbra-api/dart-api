// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_envelope.dart';
import 'package:zimbra_api/src/common/type/soap_header.dart';

import 'conv_action_body.dart';

class ConvActionEnvelope extends SoapEnvelope {
  ConvActionEnvelope(ConvActionBody body, {super.header}) : super(body);

  factory ConvActionEnvelope.fromJson(Map<String, dynamic> json) =>
      ConvActionEnvelope(ConvActionBody.fromJson(json['Body']),
          header: json['Header'] != null ? SoapHeader.fromJson(json['Header']) : null);

  ConvActionBody get convActionBody => body as ConvActionBody;
}