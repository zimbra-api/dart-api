// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_body.dart';
import 'package:zimbra_api/src/common/type/soap_fault.dart';

import 'ical_reply_request.dart';
import 'ical_reply_response.dart';

class ICalReplyBody extends SoapBody {
  ICalReplyBody({ICalReplyRequest? request, ICalReplyResponse? response, super.fault})
      : super(request: request, response: response);

  factory ICalReplyBody.fromMap(Map<String, dynamic> data) => ICalReplyBody(
      response: data['ICalReplyResponse'] != null ? ICalReplyResponse.fromMap(data['ICalReplyResponse']) : null,
      fault: data['Fault'] != null ? SoapFault.fromMap(data['Fault']) : null);

  ICalReplyRequest? get iCalReplyRequest => request as ICalReplyRequest?;

  ICalReplyResponse? get iCalReplyResponse => response as ICalReplyResponse?;

  @override
  Map<String, dynamic> toMap() => {
        if (request != null) 'ICalReplyRequest': request!.toMap(),
      };
}
