// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_header.dart';
import 'package:zimbra_api/src/common/type/soap_envelope.dart';
import 'package:zimbra_api/src/common/type/soap_request.dart';

import 'invalidate_reminder_device_body.dart';
import 'invalidate_reminder_device_envelope.dart';

/// Invalidate reminder device
class InvalidateReminderDeviceRequest extends SoapRequest {
  /// Device email address
  final String address;

  InvalidateReminderDeviceRequest(this.address);

  @override
  SoapEnvelope getEnvelope({SoapHeader? header}) =>
      InvalidateReminderDeviceEnvelope(InvalidateReminderDeviceBody(request: this), header: header);

  @override
  Map<String, dynamic> toMap() => {
        '_jsns': 'urn:zimbraMail',
        'a': address,
      };
}
