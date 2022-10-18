// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_envelope.dart';
import 'package:zimbra_api/src/common/type/soap_header.dart';

import 'enable_shared_reminder_body.dart';

class EnableSharedReminderEnvelope extends SoapEnvelope {
  EnableSharedReminderEnvelope(EnableSharedReminderBody body, {super.header}) : super(body);

  factory EnableSharedReminderEnvelope.fromJson(Map<String, dynamic> json) =>
      EnableSharedReminderEnvelope(EnableSharedReminderBody.fromJson(json['Body']),
          header: json['Header'] != null ? SoapHeader.fromJson(json['Header']) : null);

  EnableSharedReminderBody get enableSharedReminderBody => body as EnableSharedReminderBody;
}
