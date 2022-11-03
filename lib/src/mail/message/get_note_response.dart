// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_response.dart';
import 'package:zimbra_api/src/mail/type/note_info.dart';

class GetNoteResponse extends SoapResponse {
  /// Note information
  final NoteInfo? note;

  GetNoteResponse({this.note});

  factory GetNoteResponse.fromMap(Map<String, dynamic> data) =>
      GetNoteResponse(note: data['note'] is Map ? NoteInfo.fromMap(data['note']) : null);
}
