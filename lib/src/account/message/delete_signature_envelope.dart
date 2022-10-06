// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_envelope.dart';
import 'package:zimbra_api/src/common/type/soap_header.dart';

import 'delete_signature_body.dart';

class DeleteSignatureEnvelope extends SoapEnvelope {
  DeleteSignatureEnvelope(DeleteSignatureBody body, {super.header}) : super(body);

  factory DeleteSignatureEnvelope.fromJson(Map<String, dynamic> json) =>
      DeleteSignatureEnvelope(DeleteSignatureBody.fromJson(json['Body']),
          header: json['Header'] != null ? SoapHeader.fromJson(json['Header']) : null);

  DeleteSignatureBody get deleteSignatureBody => body as DeleteSignatureBody;
}
