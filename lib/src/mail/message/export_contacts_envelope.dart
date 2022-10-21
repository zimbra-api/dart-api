// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_envelope.dart';
import 'package:zimbra_api/src/common/type/soap_header.dart';

import 'export_contacts_body.dart';

class ExportContactsEnvelope extends SoapEnvelope {
  ExportContactsEnvelope(ExportContactsBody body, {super.header}) : super(body);

  factory ExportContactsEnvelope.fromJson(Map<String, dynamic> json) =>
      ExportContactsEnvelope(ExportContactsBody.fromJson(json['Body']),
          header: json['Header'] != null ? SoapHeader.fromJson(json['Header']) : null);

  ExportContactsBody get exportContactsBody => body as ExportContactsBody;
}