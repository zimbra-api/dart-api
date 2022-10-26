// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_body.dart';
import 'package:zimbra_api/src/common/type/soap_fault.dart';

import 'send_share_notification_request.dart';
import 'send_share_notification_response.dart';

class SendShareNotificationBody extends SoapBody {
  SendShareNotificationBody(
      {SendShareNotificationRequest? request, SendShareNotificationResponse? response, super.fault})
      : super(request: request, response: response);

  factory SendShareNotificationBody.fromJson(Map<String, dynamic> json) => SendShareNotificationBody(
      response: json['SendShareNotificationResponse'] != null
          ? SendShareNotificationResponse.fromJson(json['SendShareNotificationResponse'])
          : null,
      fault: json['Fault'] != null ? SoapFault.fromJson(json['Fault']) : null);

  SendShareNotificationRequest? get sendShareNotificationRequest => request as SendShareNotificationRequest?;

  SendShareNotificationResponse? get sendShareNotificationResponse => response as SendShareNotificationResponse?;

  @override
  Map<String, dynamic> toJson() => {
        if (request != null) 'SendShareNotificationRequest': request!.toJson(),
      };
}
