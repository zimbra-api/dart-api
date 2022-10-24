// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_body.dart';
import 'package:zimbra_api/src/common/type/soap_fault.dart';

import 'reset_recent_message_count_request.dart';
import 'reset_recent_message_count_response.dart';

class ResetRecentMessageCountBody extends SoapBody {
  ResetRecentMessageCountBody(
      {ResetRecentMessageCountRequest? request, ResetRecentMessageCountResponse? response, super.fault})
      : super(request: request, response: response);

  factory ResetRecentMessageCountBody.fromJson(Map<String, dynamic> json) => ResetRecentMessageCountBody(
      response: json['ResetRecentMessageCountResponse'] != null
          ? ResetRecentMessageCountResponse.fromJson(json['ResetRecentMessageCountResponse'])
          : null,
      fault: json['Fault'] != null ? SoapFault.fromJson(json['Fault']) : null);

  ResetRecentMessageCountRequest? get resetRecentMessageCountRequest => request as ResetRecentMessageCountRequest?;

  ResetRecentMessageCountResponse? get resetRecentMessageCountResponse => response as ResetRecentMessageCountResponse?;

  @override
  Map<String, dynamic> toJson() => {
        if (request != null) 'ResetRecentMessageCountRequest': request!.toJson(),
      };
}
