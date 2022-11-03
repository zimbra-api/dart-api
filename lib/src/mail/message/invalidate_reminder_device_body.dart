// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_body.dart';
import 'package:zimbra_api/src/common/type/soap_fault.dart';

import 'invalidate_reminder_device_request.dart';
import 'invalidate_reminder_device_response.dart';

class InvalidateReminderDeviceBody extends SoapBody {
  InvalidateReminderDeviceBody(
      {InvalidateReminderDeviceRequest? request, InvalidateReminderDeviceResponse? response, super.fault})
      : super(request: request, response: response);

  factory InvalidateReminderDeviceBody.fromMap(Map<String, dynamic> data) => InvalidateReminderDeviceBody(
      response: data['InvalidateReminderDeviceResponse'] != null
          ? InvalidateReminderDeviceResponse.fromMap(data['InvalidateReminderDeviceResponse'])
          : null,
      fault: data['Fault'] != null ? SoapFault.fromMap(data['Fault']) : null);

  @override
  Map<String, dynamic> toMap() => {
        if (request != null) 'InvalidateReminderDeviceRequest': request!.toMap(),
      };
}
