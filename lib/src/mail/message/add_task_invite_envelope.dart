// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_envelope.dart';
import 'package:zimbra_api/src/common/type/soap_header.dart';

import 'add_task_invite_body.dart';

class AddTaskInviteEnvelope extends SoapEnvelope {
  AddTaskInviteEnvelope(AddTaskInviteBody body, {super.header}) : super(body);

  factory AddTaskInviteEnvelope.fromJson(Map<String, dynamic> json) =>
      AddTaskInviteEnvelope(AddTaskInviteBody.fromJson(json['Body']),
          header: json['Header'] != null ? SoapHeader.fromJson(json['Header']) : null);

  AddTaskInviteBody get addTaskInviteBody => body as AddTaskInviteBody;
}
