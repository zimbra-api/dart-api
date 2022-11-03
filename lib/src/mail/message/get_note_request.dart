// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/id.dart';
import 'package:zimbra_api/src/common/type/soap_header.dart';
import 'package:zimbra_api/src/common/type/soap_envelope.dart';
import 'package:zimbra_api/src/common/type/soap_request.dart';

import 'get_note_body.dart';
import 'get_note_envelope.dart';

/// Get note
class GetNoteRequest extends SoapRequest {
  /// Specification for note
  final Id note;

  GetNoteRequest(this.note);

  @override
  SoapEnvelope getEnvelope({SoapHeader? header}) => GetNoteEnvelope(GetNoteBody(request: this), header: header);

  @override
  Map<String, dynamic> toMap() => {
        '_jsns': 'urn:zimbraMail',
        'note': note.toMap(),
      };
}
