// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_envelope.dart';
import 'package:zimbra_api/src/common/type/soap_header.dart';

import 'create_identity_body.dart';

class CreateIdentityEnvelope extends SoapEnvelope {
  CreateIdentityEnvelope(CreateIdentityBody body, {SoapHeader? header}) : super(body, header: header);

  factory CreateIdentityEnvelope.fromJson(Map<String, dynamic> json) =>
      CreateIdentityEnvelope(CreateIdentityBody.fromJson(json['Body']),
          header: json['Header'] != null ? SoapHeader.fromJson(json['Header']) : null);

  CreateIdentityBody get createIdentityBody => body as CreateIdentityBody;
}
