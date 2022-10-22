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

  factory InvalidateReminderDeviceBody.fromJson(Map<String, dynamic> json) => InvalidateReminderDeviceBody(
      response: json['InvalidateReminderDeviceResponse'] != null
          ? InvalidateReminderDeviceResponse.fromJson(json['InvalidateReminderDeviceResponse'])
          : null,
      fault: json['Fault'] != null ? SoapFault.fromJson(json['Fault']) : null);

  InvalidateReminderDeviceRequest? get invalidateReminderDeviceRequest => request as InvalidateReminderDeviceRequest?;

  InvalidateReminderDeviceResponse? get invalidateReminderDeviceResponse =>
      response as InvalidateReminderDeviceResponse?;

  @override
  Map<String, dynamic> toJson() => {
        if (request != null) 'InvalidateReminderDeviceRequest': request!.toJson(),
      };
}
