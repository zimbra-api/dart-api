// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import '../../common/type/soap_envelope.dart';
import '../../common/type/soap_header.dart';
import 'enable_shared_reminder_body.dart';

class EnableSharedReminderEnvelope extends SoapEnvelope {
  EnableSharedReminderEnvelope(
    EnableSharedReminderBody body, {
    super.header,
  }) : super(body..response?.header = header);

  factory EnableSharedReminderEnvelope.fromMap(
    Map<String, dynamic> data,
  ) =>
      EnableSharedReminderEnvelope(
        EnableSharedReminderBody.fromMap(data['Body']),
        header: data['Header'] != null
            ? SoapHeader.fromMap(
                data['Header'],
              )
            : null,
      );
}
