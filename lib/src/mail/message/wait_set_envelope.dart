// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_envelope.dart';
import 'package:zimbra_api/src/common/type/soap_header.dart';

import 'wait_set_body.dart';

class WaitSetEnvelope extends SoapEnvelope {
  WaitSetEnvelope(WaitSetBody body, {super.header}) : super(body..response?.header = header);

  factory WaitSetEnvelope.fromMap(Map<String, dynamic> data) => WaitSetEnvelope(WaitSetBody.fromMap(data['Body']),
      header: data['Header'] != null ? SoapHeader.fromMap(data['Header']) : null);
}
