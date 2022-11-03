// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_body.dart';
import 'package:zimbra_api/src/common/type/soap_fault.dart';

import 'get_imap_recent_request.dart';
import 'get_imap_recent_response.dart';

class GetIMAPRecentBody extends SoapBody {
  GetIMAPRecentBody({GetIMAPRecentRequest? request, GetIMAPRecentResponse? response, super.fault})
      : super(request: request, response: response);

  factory GetIMAPRecentBody.fromMap(Map<String, dynamic> data) => GetIMAPRecentBody(
      response:
          data['GetIMAPRecentResponse'] != null ? GetIMAPRecentResponse.fromMap(data['GetIMAPRecentResponse']) : null,
      fault: data['Fault'] != null ? SoapFault.fromMap(data['Fault']) : null);

  GetIMAPRecentRequest? get getIMAPRecentRequest => request as GetIMAPRecentRequest?;

  GetIMAPRecentResponse? get getIMAPRecentResponse => response as GetIMAPRecentResponse?;

  @override
  Map<String, dynamic> toMap() => {
        if (request != null) 'GetIMAPRecentRequest': request!.toMap(),
      };
}
