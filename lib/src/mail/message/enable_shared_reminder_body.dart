// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import '../../common/type/soap_body.dart';
import 'enable_shared_reminder_request.dart';
import 'enable_shared_reminder_response.dart';

class EnableSharedReminderBody extends SoapBody {
  EnableSharedReminderBody({
    EnableSharedReminderRequest? request,
    EnableSharedReminderResponse? response,
  }) : super(request: request, response: response);

  factory EnableSharedReminderBody.fromMap(
    Map<String, dynamic> data,
  ) =>
      EnableSharedReminderBody(
        response: data['EnableSharedReminderResponse'] != null
            ? EnableSharedReminderResponse.fromMap(
                data['EnableSharedReminderResponse'],
              )
            : null,
      );

  @override
  Map<String, dynamic> toMap() => {
        if (request != null) 'EnableSharedReminderRequest': request!.toMap(),
      };
}
