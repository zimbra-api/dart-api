// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_envelope.dart';
import 'package:zimbra_api/src/common/type/soap_header.dart';

import 'get_import_status_body.dart';

class GetImportStatusEnvelope extends SoapEnvelope {
  GetImportStatusEnvelope(GetImportStatusBody body, {super.header}) : super(body..response?.header = header);

  factory GetImportStatusEnvelope.fromMap(Map<String, dynamic> data) =>
      GetImportStatusEnvelope(GetImportStatusBody.fromMap(data['Body']),
          header: data['Header'] != null ? SoapHeader.fromMap(data['Header']) : null);

  GetImportStatusBody get getImportStatusBody => body as GetImportStatusBody;
}
