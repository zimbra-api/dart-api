// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_envelope.dart';
import 'package:zimbra_api/src/common/type/soap_header.dart';

import 'create_note_body.dart';

class CreateNoteEnvelope extends SoapEnvelope {
  CreateNoteEnvelope(CreateNoteBody body, {super.header}) : super(body);

  factory CreateNoteEnvelope.fromJson(Map<String, dynamic> json) =>
      CreateNoteEnvelope(CreateNoteBody.fromJson(json['Body']),
          header: json['Header'] != null ? SoapHeader.fromJson(json['Header']) : null);

  CreateNoteBody get createNoteBody => body as CreateNoteBody;
}
