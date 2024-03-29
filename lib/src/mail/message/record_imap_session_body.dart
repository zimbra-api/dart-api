// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import '../../common/type/soap_body.dart';
import 'record_imap_session_request.dart';
import 'record_imap_session_response.dart';

class RecordIMAPSessionBody extends SoapBody {
  RecordIMAPSessionBody({
    RecordIMAPSessionRequest? request,
    RecordIMAPSessionResponse? response,
  }) : super(request: request, response: response);

  factory RecordIMAPSessionBody.fromMap(
    Map<String, dynamic> data,
  ) =>
      RecordIMAPSessionBody(
        response: data['RecordIMAPSessionResponse'] != null
            ? RecordIMAPSessionResponse.fromMap(
                data['RecordIMAPSessionResponse'],
              )
            : null,
      );

  @override
  Map<String, dynamic> toMap() => {
        if (request != null) 'RecordIMAPSessionRequest': request!.toMap(),
      };
}
