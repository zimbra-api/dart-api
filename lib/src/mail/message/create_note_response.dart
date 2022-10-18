// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_response.dart';
import 'package:zimbra_api/src/mail/type/note_info.dart';

class CreateNoteResponse extends SoapResponse {
  /// Details of the created note
  final NoteInfo? note;

  CreateNoteResponse({this.note});

  factory CreateNoteResponse.fromJson(Map<String, dynamic> json) =>
      CreateNoteResponse(note: json['note'] is Map ? NoteInfo.fromJson(json['note']) : null);
}
