// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_envelope.dart';
import 'package:zimbra_api/src/common/type/soap_header.dart';

import 'destroy_wait_set_body.dart';

class DestroyWaitSetEnvelope extends SoapEnvelope {
  DestroyWaitSetEnvelope(DestroyWaitSetBody body, {super.header}) : super(body..response?.header = header);

  factory DestroyWaitSetEnvelope.fromMap(Map<String, dynamic> data) =>
      DestroyWaitSetEnvelope(DestroyWaitSetBody.fromMap(data['Body']),
          header: data['Header'] != null ? SoapHeader.fromMap(data['Header']) : null);

  DestroyWaitSetBody get destroyWaitSetBody => body as DestroyWaitSetBody;
}
