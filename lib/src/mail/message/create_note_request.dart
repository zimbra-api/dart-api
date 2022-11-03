// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_header.dart';
import 'package:zimbra_api/src/common/type/soap_envelope.dart';
import 'package:zimbra_api/src/common/type/soap_request.dart';
import 'package:zimbra_api/src/mail/type/new_note_spec.dart';

import 'create_note_body.dart';
import 'create_note_envelope.dart';

/// Create a note
class CreateNoteRequest extends SoapRequest {
  /// New note specification
  final NewNoteSpec note;

  CreateNoteRequest(this.note);

  @override
  SoapEnvelope getEnvelope({SoapHeader? header}) => CreateNoteEnvelope(CreateNoteBody(request: this), header: header);

  @override
  Map<String, dynamic> toMap() => {
        '_jsns': 'urn:zimbraMail',
        'note': note.toMap(),
      };
}
