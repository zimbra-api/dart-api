// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import '../../common/type/soap_body.dart';
import 'send_share_notification_request.dart';
import 'send_share_notification_response.dart';

class SendShareNotificationBody extends SoapBody {
  SendShareNotificationBody(
      {SendShareNotificationRequest? request, SendShareNotificationResponse? response})
      : super(request: request, response: response);

  factory SendShareNotificationBody.fromMap(Map<String, dynamic> data) => SendShareNotificationBody(
      response: data['SendShareNotificationResponse'] != null
          ? SendShareNotificationResponse.fromMap(data['SendShareNotificationResponse'])
          : null);

  @override
  Map<String, dynamic> toMap() => {
        if (request != null) 'SendShareNotificationRequest': request!.toMap(),
      };
}
