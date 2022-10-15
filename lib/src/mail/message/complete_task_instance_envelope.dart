// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_envelope.dart';
import 'package:zimbra_api/src/common/type/soap_header.dart';

import 'complete_task_instance_body.dart';

class CompleteTaskInstanceEnvelope extends SoapEnvelope {
  CompleteTaskInstanceEnvelope(CompleteTaskInstanceBody body, {super.header}) : super(body);

  factory CompleteTaskInstanceEnvelope.fromJson(Map<String, dynamic> json) =>
      CompleteTaskInstanceEnvelope(CompleteTaskInstanceBody.fromJson(json['Body']),
          header: json['Header'] != null ? SoapHeader.fromJson(json['Header']) : null);

  CompleteTaskInstanceBody get completeTaskInstanceBody => body as CompleteTaskInstanceBody;
}
