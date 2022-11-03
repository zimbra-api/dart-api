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

  factory EnableSharedReminderBody.fromMap(Map<String, dynamic> data) => EnableSharedReminderBody(
      response: data['EnableSharedReminderResponse'] != null
          ? EnableSharedReminderResponse.fromMap(data['EnableSharedReminderResponse'])
          : null,
      fault: data['Fault'] != null ? SoapFault.fromMap(data['Fault']) : null);

  EnableSharedReminderRequest? get enableSharedReminderRequest => request as EnableSharedReminderRequest?;

  EnableSharedReminderResponse? get enableSharedReminderResponse => response as EnableSharedReminderResponse?;

  @override
  Map<String, dynamic> toMap() => {
        if (request != null) 'EnableSharedReminderRequest': request!.toMap(),
      };
}
