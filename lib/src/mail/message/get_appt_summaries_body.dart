// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import '../../common/type/soap_body.dart';
import 'get_appt_summaries_request.dart';
import 'get_appt_summaries_response.dart';

class GetApptSummariesBody extends SoapBody {
  GetApptSummariesBody({GetApptSummariesRequest? request, GetApptSummariesResponse? response})
      : super(request: request, response: response);

  factory GetApptSummariesBody.fromMap(Map<String, dynamic> data) => GetApptSummariesBody(
      response: data['GetApptSummariesResponse'] != null
          ? GetApptSummariesResponse.fromMap(data['GetApptSummariesResponse'])
          : null);

  @override
  Map<String, dynamic> toMap() => {
        if (request != null) 'GetApptSummariesRequest': request!.toMap(),
      };
}
