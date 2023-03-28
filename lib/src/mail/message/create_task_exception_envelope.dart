// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import '../../common/type/soap_envelope.dart';
import '../../common/type/soap_header.dart';
import 'create_task_exception_body.dart';

class CreateTaskExceptionEnvelope extends SoapEnvelope {
  CreateTaskExceptionEnvelope(
    CreateTaskExceptionBody body, {
    super.header,
  }) : super(body..response?.header = header);

  factory CreateTaskExceptionEnvelope.fromMap(
    Map<String, dynamic> data,
  ) =>
      CreateTaskExceptionEnvelope(
        CreateTaskExceptionBody.fromMap(data['Body']),
        header: data['Header'] != null
            ? SoapHeader.fromMap(
                data['Header'],
              )
            : null,
      );
}
