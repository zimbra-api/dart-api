// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_envelope.dart';
import 'package:zimbra_api/src/common/type/soap_header.dart';

import 'import_data_body.dart';

class ImportDataEnvelope extends SoapEnvelope {
  ImportDataEnvelope(ImportDataBody body, {super.header}) : super(body..response?.header = header);

  factory ImportDataEnvelope.fromMap(Map<String, dynamic> data) =>
      ImportDataEnvelope(ImportDataBody.fromMap(data['Body']),
          header: data['Header'] != null ? SoapHeader.fromMap(data['Header']) : null);
}
