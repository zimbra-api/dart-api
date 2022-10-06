// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_envelope.dart';
import 'package:zimbra_api/src/common/type/soap_header.dart';

import 'create_signature_body.dart';

class CreateSignatureEnvelope extends SoapEnvelope {
  CreateSignatureEnvelope(CreateSignatureBody body, {SoapHeader? header}) : super(body, header: header);

  factory CreateSignatureEnvelope.fromJson(Map<String, dynamic> json) =>
      CreateSignatureEnvelope(CreateSignatureBody.fromJson(json['Body']),
          header: json['Header'] != null ? SoapHeader.fromJson(json['Header']) : null);

  CreateSignatureBody get createSignatureBody => body as CreateSignatureBody;
}
