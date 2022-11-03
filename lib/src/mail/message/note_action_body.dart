// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_body.dart';

import 'note_action_request.dart';
import 'note_action_response.dart';

class NoteActionBody extends SoapBody {
  NoteActionBody({NoteActionRequest? request, NoteActionResponse? response})
      : super(request: request, response: response);

  factory NoteActionBody.fromMap(Map<String, dynamic> data) => NoteActionBody(
      response: data['NoteActionResponse'] != null ? NoteActionResponse.fromMap(data['NoteActionResponse']) : null);

  @override
  Map<String, dynamic> toMap() => {
        if (request != null) 'NoteActionRequest': request!.toMap(),
      };
}
