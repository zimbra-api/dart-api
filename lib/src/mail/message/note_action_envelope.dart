// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_envelope.dart';
import 'package:zimbra_api/src/common/type/soap_header.dart';

import 'note_action_body.dart';

class NoteActionEnvelope extends SoapEnvelope {
  NoteActionEnvelope(NoteActionBody body, {super.header}) : super(body);

  factory NoteActionEnvelope.fromJson(Map<String, dynamic> json) =>
      NoteActionEnvelope(NoteActionBody.fromJson(json['Body']),
          header: json['Header'] != null ? SoapHeader.fromJson(json['Header']) : null);

  NoteActionBody get noteActionBody => body as NoteActionBody;
}
