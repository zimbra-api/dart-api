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

  factory GetIMAPRecentCutoffBody.fromJson(Map<String, dynamic> json) => GetIMAPRecentCutoffBody(
      response: json['GetIMAPRecentCutoffResponse'] != null
          ? GetIMAPRecentCutoffResponse.fromJson(json['GetIMAPRecentCutoffResponse'])
          : null,
      fault: json['Fault'] != null ? SoapFault.fromJson(json['Fault']) : null);

  GetIMAPRecentCutoffRequest? get getIMAPRecentCutoffRequest => request as GetIMAPRecentCutoffRequest?;

  GetIMAPRecentCutoffResponse? get getIMAPRecentCutoffResponse => response as GetIMAPRecentCutoffResponse?;

  @override
  Map<String, dynamic> toJson() => {
        if (request != null) 'GetIMAPRecentCutoffRequest': request!.toJson(),
      };
}