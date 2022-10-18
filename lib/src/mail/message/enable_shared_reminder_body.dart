// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_body.dart';
import 'package:zimbra_api/src/common/type/soap_fault.dart';

import 'enable_shared_reminder_request.dart';
import 'enable_shared_reminder_response.dart';

class EnableSharedReminderBody extends SoapBody {
  EnableSharedReminderBody({EnableSharedReminderRequest? request, EnableSharedReminderResponse? response, super.fault})
      : super(request: request, response: response);

  factory EnableSharedReminderBody.fromJson(Map<String, dynamic> json) => EnableSharedReminderBody(
      response: json['EnableSharedReminderResponse'] != null
          ? EnableSharedReminderResponse.fromJson(json['EnableSharedReminderResponse'])
          : null,
      fault: json['Fault'] != null ? SoapFault.fromJson(json['Fault']) : null);

  EnableSharedReminderRequest? get enableSharedReminderRequest => request as EnableSharedReminderRequest?;

  EnableSharedReminderResponse? get enableSharedReminderResponse => response as EnableSharedReminderResponse?;

  @override
  Map<String, dynamic> toJson() => {
        if (request != null) 'EnableSharedReminderRequest': request!.toJson(),
      };
}
