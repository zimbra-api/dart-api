// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_envelope.dart';
import 'package:zimbra_api/src/common/type/soap_header.dart';

import 'create_contact_body.dart';

class CreateContactEnvelope extends SoapEnvelope {
  CreateContactEnvelope(CreateContactBody body, {super.header}) : super(body);

  factory CreateContactEnvelope.fromJson(Map<String, dynamic> json) =>
      CreateContactEnvelope(CreateContactBody.fromJson(json['Body']),
          header: json['Header'] != null ? SoapHeader.fromJson(json['Header']) : null);

  CreateContactBody get createContactBody => body as CreateContactBody;
}