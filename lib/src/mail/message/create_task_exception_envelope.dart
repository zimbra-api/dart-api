// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_envelope.dart';
import 'package:zimbra_api/src/common/type/soap_header.dart';

import 'create_task_exception_body.dart';

class CreateTaskExceptionEnvelope extends SoapEnvelope {
  CreateTaskExceptionEnvelope(CreateTaskExceptionBody body, {super.header}) : super(body);

  factory CreateTaskExceptionEnvelope.fromJson(Map<String, dynamic> json) =>
      CreateTaskExceptionEnvelope(CreateTaskExceptionBody.fromJson(json['Body']),
          header: json['Header'] != null ? SoapHeader.fromJson(json['Header']) : null);

  CreateTaskExceptionBody get createTaskExceptionBody => body as CreateTaskExceptionBody;
}
