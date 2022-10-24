// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_envelope.dart';
import 'package:zimbra_api/src/common/type/soap_header.dart';

import 'restore_contacts_body.dart';

class RestoreContactsEnvelope extends SoapEnvelope {
  RestoreContactsEnvelope(RestoreContactsBody body, {super.header}) : super(body);

  factory RestoreContactsEnvelope.fromJson(Map<String, dynamic> json) =>
      RestoreContactsEnvelope(RestoreContactsBody.fromJson(json['Body']),
          header: json['Header'] != null ? SoapHeader.fromJson(json['Header']) : null);

  RestoreContactsBody get restoreContactsBody => body as RestoreContactsBody;
}
