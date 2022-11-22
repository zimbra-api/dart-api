// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import '../../common/type/soap_body.dart';
import 'ical_reply_request.dart';
import 'ical_reply_response.dart';

class ICalReplyBody extends SoapBody {
  ICalReplyBody({ICalReplyRequest? request, ICalReplyResponse? response})
      : super(request: request, response: response);

  factory ICalReplyBody.fromMap(Map<String, dynamic> data) => ICalReplyBody(
      response: data['ICalReplyResponse'] != null ? ICalReplyResponse.fromMap(data['ICalReplyResponse']) : null);

  @override
  Map<String, dynamic> toMap() => {
        if (request != null) 'ICalReplyRequest': request!.toMap(),
      };
}
