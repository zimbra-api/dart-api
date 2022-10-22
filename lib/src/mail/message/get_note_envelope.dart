// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_envelope.dart';
import 'package:zimbra_api/src/common/type/soap_header.dart';

import 'get_note_body.dart';

class GetNoteEnvelope extends SoapEnvelope {
  GetNoteEnvelope(GetNoteBody body, {super.header}) : super(body);

  factory GetNoteEnvelope.fromJson(Map<String, dynamic> json) => GetNoteEnvelope(GetNoteBody.fromJson(json['Body']),
      header: json['Header'] != null ? SoapHeader.fromJson(json['Header']) : null);

  GetNoteBody get getNoteBody => body as GetNoteBody;
}
