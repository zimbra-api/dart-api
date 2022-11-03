// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_envelope.dart';
import 'package:zimbra_api/src/common/type/soap_header.dart';

import 'purge_revision_body.dart';

class PurgeRevisionEnvelope extends SoapEnvelope {
  PurgeRevisionEnvelope(PurgeRevisionBody body, {super.header}) : super(body);

  factory PurgeRevisionEnvelope.fromMap(Map<String, dynamic> data) =>
      PurgeRevisionEnvelope(PurgeRevisionBody.fromMap(data['Body']),
          header: data['Header'] != null ? SoapHeader.fromMap(data['Header']) : null);

  PurgeRevisionBody get purgeRevisionBody => body as PurgeRevisionBody;
}
