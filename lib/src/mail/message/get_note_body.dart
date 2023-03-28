// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import '../../common/type/soap_body.dart';
import 'get_note_request.dart';
import 'get_note_response.dart';

class GetNoteBody extends SoapBody {
  GetNoteBody({
    GetNoteRequest? request,
    GetNoteResponse? response,
  }) : super(request: request, response: response);

  factory GetNoteBody.fromMap(Map<String, dynamic> data) => GetNoteBody(
        response: data['GetNoteResponse'] != null
            ? GetNoteResponse.fromMap(
                data['GetNoteResponse'],
              )
            : null,
      );

  @override
  Map<String, dynamic> toMap() => {
        if (request != null) 'GetNoteRequest': request!.toMap(),
      };
}
