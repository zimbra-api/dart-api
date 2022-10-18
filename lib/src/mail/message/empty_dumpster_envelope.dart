// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_envelope.dart';
import 'package:zimbra_api/src/common/type/soap_header.dart';

import 'empty_dumpster_body.dart';

class EmptyDumpsterEnvelope extends SoapEnvelope {
  EmptyDumpsterEnvelope(EmptyDumpsterBody body, {super.header}) : super(body);

  factory EmptyDumpsterEnvelope.fromJson(Map<String, dynamic> json) =>
      EmptyDumpsterEnvelope(EmptyDumpsterBody.fromJson(json['Body']),
          header: json['Header'] != null ? SoapHeader.fromJson(json['Header']) : null);

  EmptyDumpsterBody get emptyDumpsterBody => body as EmptyDumpsterBody;
}
