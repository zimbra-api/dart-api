// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_body.dart';
import 'package:zimbra_api/src/common/type/soap_fault.dart';

import 'get_appt_summaries_request.dart';
import 'get_appt_summaries_response.dart';

class GetApptSummariesBody extends SoapBody {
  GetApptSummariesBody({GetApptSummariesRequest? request, GetApptSummariesResponse? response, super.fault})
      : super(request: request, response: response);

  factory GetApptSummariesBody.fromMap(Map<String, dynamic> data) => GetApptSummariesBody(
      response: data['GetApptSummariesResponse'] != null
          ? GetApptSummariesResponse.fromMap(data['GetApptSummariesResponse'])
          : null,
      fault: data['Fault'] != null ? SoapFault.fromMap(data['Fault']) : null);

  GetApptSummariesRequest? get getApptSummariesRequest => request as GetApptSummariesRequest?;

  GetApptSummariesResponse? get getApptSummariesResponse => response as GetApptSummariesResponse?;

  @override
  Map<String, dynamic> toMap() => {
        if (request != null) 'GetApptSummariesRequest': request!.toMap(),
      };
}
