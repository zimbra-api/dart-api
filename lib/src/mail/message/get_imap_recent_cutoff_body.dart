// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_body.dart';
import 'package:zimbra_api/src/common/type/soap_fault.dart';

import 'get_imap_recent_cutoff_request.dart';
import 'get_imap_recent_cutoff_response.dart';

class GetIMAPRecentCutoffBody extends SoapBody {
  GetIMAPRecentCutoffBody({GetIMAPRecentCutoffRequest? request, GetIMAPRecentCutoffResponse? response, super.fault})
      : super(request: request, response: response);

  factory GetIMAPRecentCutoffBody.fromMap(Map<String, dynamic> data) => GetIMAPRecentCutoffBody(
      response: data['GetIMAPRecentCutoffResponse'] != null
          ? GetIMAPRecentCutoffResponse.fromMap(data['GetIMAPRecentCutoffResponse'])
          : null,
      fault: data['Fault'] != null ? SoapFault.fromMap(data['Fault']) : null);

  @override
  Map<String, dynamic> toMap() => {
        if (request != null) 'GetIMAPRecentCutoffRequest': request!.toMap(),
      };
}
