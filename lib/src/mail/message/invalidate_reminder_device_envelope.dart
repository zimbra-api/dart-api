// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_envelope.dart';
import 'package:zimbra_api/src/common/type/soap_header.dart';

import 'invalidate_reminder_device_body.dart';

class InvalidateReminderDeviceEnvelope extends SoapEnvelope {
  InvalidateReminderDeviceEnvelope(InvalidateReminderDeviceBody body, {super.header}) : super(body);

  factory InvalidateReminderDeviceEnvelope.fromJson(Map<String, dynamic> json) =>
      InvalidateReminderDeviceEnvelope(InvalidateReminderDeviceBody.fromJson(json['Body']),
          header: json['Header'] != null ? SoapHeader.fromJson(json['Header']) : null);

  InvalidateReminderDeviceBody get invalidateReminderDeviceBody => body as InvalidateReminderDeviceBody;
}
