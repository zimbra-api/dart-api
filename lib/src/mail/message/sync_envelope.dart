// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_envelope.dart';
import 'package:zimbra_api/src/common/type/soap_header.dart';

import 'sync_body.dart';

class SyncEnvelope extends SoapEnvelope {
  SyncEnvelope(SyncBody body, {super.header}) : super(body);

  factory SyncEnvelope.fromJson(Map<String, dynamic> json) => SyncEnvelope(SyncBody.fromJson(json['Body']),
      header: json['Header'] != null ? SoapHeader.fromJson(json['Header']) : null);

  SyncBody get syncBody => body as SyncBody;
}
