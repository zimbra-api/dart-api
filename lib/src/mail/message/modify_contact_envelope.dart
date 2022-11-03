// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_envelope.dart';
import 'package:zimbra_api/src/common/type/soap_header.dart';

import 'modify_contact_body.dart';

class ModifyContactEnvelope extends SoapEnvelope {
  ModifyContactEnvelope(ModifyContactBody body, {super.header}) : super(body);

  factory ModifyContactEnvelope.fromMap(Map<String, dynamic> data) =>
      ModifyContactEnvelope(ModifyContactBody.fromMap(data['Body']),
          header: data['Header'] != null ? SoapHeader.fromMap(data['Header']) : null);

  ModifyContactBody get modifyContactBody => body as ModifyContactBody;
}
