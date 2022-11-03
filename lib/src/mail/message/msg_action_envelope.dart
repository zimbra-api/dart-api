// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_envelope.dart';
import 'package:zimbra_api/src/common/type/soap_header.dart';

import 'msg_action_body.dart';

class MsgActionEnvelope extends SoapEnvelope {
  MsgActionEnvelope(MsgActionBody body, {super.header}) : super(body);

  factory MsgActionEnvelope.fromMap(Map<String, dynamic> data) =>
      MsgActionEnvelope(MsgActionBody.fromMap(data['Body']),
          header: data['Header'] != null ? SoapHeader.fromMap(data['Header']) : null);

  MsgActionBody get msgActionBody => body as MsgActionBody;
}
