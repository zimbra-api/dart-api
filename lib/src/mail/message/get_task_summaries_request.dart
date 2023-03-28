// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import '../../common/type/soap_envelope.dart';
import '../../common/type/soap_header.dart';
import 'get_appt_summaries_request.dart';
import 'get_task_summaries_body.dart';
import 'get_task_summaries_envelope.dart';

/// Get task summaries
class GetTaskSummariesRequest extends GetApptSummariesRequest {
  GetTaskSummariesRequest(
    super.startTime,
    super.endTime, {
    super.folderId,
  });

  @override
  SoapEnvelope getEnvelope({SoapHeader? header}) => GetTaskSummariesEnvelope(
        GetTaskSummariesBody(request: this),
        header: header,
      );
}
