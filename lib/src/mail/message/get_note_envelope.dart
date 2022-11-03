// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_envelope.dart';
import 'package:zimbra_api/src/common/type/soap_header.dart';

import 'get_note_body.dart';

class GetNoteEnvelope extends SoapEnvelope {
  GetNoteEnvelope(GetNoteBody body, {super.header}) : super(body..response?.header = header);

  factory GetNoteEnvelope.fromMap(Map<String, dynamic> data) => GetNoteEnvelope(GetNoteBody.fromMap(data['Body']),
      header: data['Header'] != null ? SoapHeader.fromMap(data['Header']) : null);

  GetNoteBody get getNoteBody => body as GetNoteBody;
}
