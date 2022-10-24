// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_body.dart';
import 'package:zimbra_api/src/common/type/soap_fault.dart';

import 'record_imap_session_request.dart';
import 'record_imap_session_response.dart';

class RecordIMAPSessionBody extends SoapBody {
  RecordIMAPSessionBody({RecordIMAPSessionRequest? request, RecordIMAPSessionResponse? response, super.fault})
      : super(request: request, response: response);

  factory RecordIMAPSessionBody.fromJson(Map<String, dynamic> json) => RecordIMAPSessionBody(
      response: json['RecordIMAPSessionResponse'] != null
          ? RecordIMAPSessionResponse.fromJson(json['RecordIMAPSessionResponse'])
          : null,
      fault: json['Fault'] != null ? SoapFault.fromJson(json['Fault']) : null);

  RecordIMAPSessionRequest? get recordIMAPSessionRequest => request as RecordIMAPSessionRequest?;

  RecordIMAPSessionResponse? get recordIMAPSessionResponse => response as RecordIMAPSessionResponse?;

  @override
  Map<String, dynamic> toJson() => {
        if (request != null) 'RecordIMAPSessionRequest': request!.toJson(),
      };
}
