// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_envelope.dart';
import 'package:zimbra_api/src/common/type/soap_header.dart';

import 'send_share_notification_body.dart';

class SendShareNotificationEnvelope extends SoapEnvelope {
  SendShareNotificationEnvelope(SendShareNotificationBody body, {super.header}) : super(body);

  factory SendShareNotificationEnvelope.fromJson(Map<String, dynamic> json) =>
      SendShareNotificationEnvelope(SendShareNotificationBody.fromJson(json['Body']),
          header: json['Header'] != null ? SoapHeader.fromJson(json['Header']) : null);

  SendShareNotificationBody get sendShareNotificationBody => body as SendShareNotificationBody;
}
