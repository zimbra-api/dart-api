// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_envelope.dart';
import 'package:zimbra_api/src/common/type/soap_header.dart';

import 'save_document_body.dart';

class SaveDocumentEnvelope extends SoapEnvelope {
  SaveDocumentEnvelope(SaveDocumentBody body, {super.header}) : super(body);

  factory SaveDocumentEnvelope.fromJson(Map<String, dynamic> json) =>
      SaveDocumentEnvelope(SaveDocumentBody.fromJson(json['Body']),
          header: json['Header'] != null ? SoapHeader.fromJson(json['Header']) : null);

  SaveDocumentBody get saveDocumentBody => body as SaveDocumentBody;
}
