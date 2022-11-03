// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_envelope.dart';
import 'package:zimbra_api/src/common/type/soap_header.dart';

import 'get_conv_body.dart';

class GetConvEnvelope extends SoapEnvelope {
  GetConvEnvelope(GetConvBody body, {super.header}) : super(body);

  factory GetConvEnvelope.fromMap(Map<String, dynamic> data) => GetConvEnvelope(GetConvBody.fromMap(data['Body']),
      header: data['Header'] != null ? SoapHeader.fromMap(data['Header']) : null);

  GetConvBody get getConvBody => body as GetConvBody;
}
