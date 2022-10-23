// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_envelope.dart';
import 'package:zimbra_api/src/common/type/soap_header.dart';

import 'modify_task_body.dart';

class ModifyTaskEnvelope extends SoapEnvelope {
  ModifyTaskEnvelope(ModifyTaskBody body, {super.header}) : super(body);

  factory ModifyTaskEnvelope.fromJson(Map<String, dynamic> json) =>
      ModifyTaskEnvelope(ModifyTaskBody.fromJson(json['Body']),
          header: json['Header'] != null ? SoapHeader.fromJson(json['Header']) : null);

  ModifyTaskBody get modifyTaskBody => body as ModifyTaskBody;
}
