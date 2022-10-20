// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_envelope.dart';
import 'package:zimbra_api/src/common/type/soap_header.dart';

import 'get_custom_metadata_body.dart';

class GetCustomMetadataEnvelope extends SoapEnvelope {
  GetCustomMetadataEnvelope(GetCustomMetadataBody body, {super.header}) : super(body);

  factory GetCustomMetadataEnvelope.fromJson(Map<String, dynamic> json) =>
      GetCustomMetadataEnvelope(GetCustomMetadataBody.fromJson(json['Body']),
          header: json['Header'] != null ? SoapHeader.fromJson(json['Header']) : null);

  GetCustomMetadataBody get getCustomMetadataBody => body as GetCustomMetadataBody;
}
