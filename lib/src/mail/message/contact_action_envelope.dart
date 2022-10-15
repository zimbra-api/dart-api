// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_envelope.dart';
import 'package:zimbra_api/src/common/type/soap_header.dart';

import 'contact_action_body.dart';

class ContactActionEnvelope extends SoapEnvelope {
  ContactActionEnvelope(ContactActionBody body, {super.header}) : super(body);

  factory ContactActionEnvelope.fromJson(Map<String, dynamic> json) =>
      ContactActionEnvelope(ContactActionBody.fromJson(json['Body']),
          header: json['Header'] != null ? SoapHeader.fromJson(json['Header']) : null);

  ContactActionBody get contactActionBody => body as ContactActionBody;
}
