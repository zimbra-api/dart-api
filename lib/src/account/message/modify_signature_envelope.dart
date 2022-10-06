// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_envelope.dart';
import 'package:zimbra_api/src/common/type/soap_header.dart';

import 'modify_signature_body.dart';

class ModifySignatureEnvelope extends SoapEnvelope {
  ModifySignatureEnvelope(ModifySignatureBody body, {SoapHeader? header}) : super(body, header: header);

  factory ModifySignatureEnvelope.fromJson(Map<String, dynamic> json) =>
      ModifySignatureEnvelope(ModifySignatureBody.fromJson(json['Body']),
          header: json['Header'] != null ? SoapHeader.fromJson(json['Header']) : null);

  ModifySignatureBody get modifySignatureBody => body as ModifySignatureBody;
}
