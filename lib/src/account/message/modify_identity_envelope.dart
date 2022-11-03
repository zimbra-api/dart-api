// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_envelope.dart';
import 'package:zimbra_api/src/common/type/soap_header.dart';

import 'modify_identity_body.dart';

class ModifyIdentityEnvelope extends SoapEnvelope {
  ModifyIdentityEnvelope(ModifyIdentityBody body, {super.header}) : super(body);

  factory ModifyIdentityEnvelope.fromMap(Map<String, dynamic> data) =>
      ModifyIdentityEnvelope(ModifyIdentityBody.fromMap(data['Body']),
          header: data['Header'] != null ? SoapHeader.fromMap(data['Header']) : null);

  ModifyIdentityBody get modifyIdentityBody => body as ModifyIdentityBody;
}
