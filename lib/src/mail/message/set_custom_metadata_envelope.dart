// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_envelope.dart';
import 'package:zimbra_api/src/common/type/soap_header.dart';

import 'set_custom_metadata_body.dart';

class SetCustomMetadataEnvelope extends SoapEnvelope {
  SetCustomMetadataEnvelope(SetCustomMetadataBody body, {super.header}) : super(body);

  factory SetCustomMetadataEnvelope.fromMap(Map<String, dynamic> data) =>
      SetCustomMetadataEnvelope(SetCustomMetadataBody.fromMap(data['Body']),
          header: data['Header'] != null ? SoapHeader.fromMap(data['Header']) : null);

  SetCustomMetadataBody get setCustomMetadataBody => body as SetCustomMetadataBody;
}
