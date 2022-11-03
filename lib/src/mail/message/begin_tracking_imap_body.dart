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

  factory BeginTrackingIMAPBody.fromMap(Map<String, dynamic> data) => BeginTrackingIMAPBody(
      response: data['BeginTrackingIMAPResponse'] != null
          ? BeginTrackingIMAPResponse.fromMap(data['BeginTrackingIMAPResponse'])
          : null,
      fault: data['Fault'] != null ? SoapFault.fromMap(data['Fault']) : null);

  BeginTrackingIMAPRequest? get beginTrackingIMAPRequest => request as BeginTrackingIMAPRequest?;

  BeginTrackingIMAPResponse? get beginTrackingIMAPResponse => response as BeginTrackingIMAPResponse?;

  @override
  Map<String, dynamic> toMap() => {
        if (request != null) 'BeginTrackingIMAPRequest': request!.toMap(),
      };
}
