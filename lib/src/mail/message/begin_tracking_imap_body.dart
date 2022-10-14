// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_body.dart';
import 'package:zimbra_api/src/common/type/soap_fault.dart';

import 'begin_tracking_imap_request.dart';
import 'begin_tracking_imap_response.dart';

class BeginTrackingIMAPBody extends SoapBody {
  BeginTrackingIMAPBody({BeginTrackingIMAPRequest? request, BeginTrackingIMAPResponse? response, super.fault})
      : super(request: request, response: response);

  factory BeginTrackingIMAPBody.fromJson(Map<String, dynamic> json) => BeginTrackingIMAPBody(
      response: json['BeginTrackingIMAPResponse'] != null
          ? BeginTrackingIMAPResponse.fromJson(json['BeginTrackingIMAPResponse'])
          : null,
      fault: json['Fault'] != null ? SoapFault.fromJson(json['Fault']) : null);

  BeginTrackingIMAPRequest? get beginTrackingIMAPRequest => request as BeginTrackingIMAPRequest?;

  BeginTrackingIMAPResponse? get beginTrackingIMAPResponse => response as BeginTrackingIMAPResponse?;

  @override
  Map<String, dynamic> toJson() => {
        if (request != null) 'BeginTrackingIMAPRequest': request!.toJson(),
      };
}
