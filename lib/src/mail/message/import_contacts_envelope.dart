// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_envelope.dart';
import 'package:zimbra_api/src/common/type/soap_header.dart';

import 'import_contacts_body.dart';

class ImportContactsEnvelope extends SoapEnvelope {
  ImportContactsEnvelope(ImportContactsBody body, {super.header}) : super(body);

  factory ImportContactsEnvelope.fromJson(Map<String, dynamic> json) =>
      ImportContactsEnvelope(ImportContactsBody.fromJson(json['Body']),
          header: json['Header'] != null ? SoapHeader.fromJson(json['Header']) : null);

  ImportContactsBody get importContactsBody => body as ImportContactsBody;
}
