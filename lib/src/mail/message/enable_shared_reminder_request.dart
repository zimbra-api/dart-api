// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import '../../common/type/soap_header.dart';
import '../../common/type/soap_envelope.dart';
import '../../common/type/soap_request.dart';
import '../type/shared_reminder_mount.dart';
import 'enable_shared_reminder_body.dart';
import 'enable_shared_reminder_envelope.dart';

/// Enable/disable reminders for shared appointments/tasks on a mountpoint
class EnableSharedReminderRequest extends SoapRequest {
  /// Specification for mountpoint
  final SharedReminderMount mount;

  EnableSharedReminderRequest(this.mount);

  @override
  SoapEnvelope getEnvelope({
    SoapHeader? header,
  }) =>
      EnableSharedReminderEnvelope(
        EnableSharedReminderBody(request: this),
        header: header,
      );

  @override
  Map<String, dynamic> toMap() => {
        '_jsns': 'urn:zimbraMail',
        'link': mount.toMap(),
      };
}
