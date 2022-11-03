// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_envelope.dart';
import 'package:zimbra_api/src/common/type/soap_header.dart';

import 'begin_tracking_imap_body.dart';

class BeginTrackingIMAPEnvelope extends SoapEnvelope {
  BeginTrackingIMAPEnvelope(BeginTrackingIMAPBody body, {super.header}) : super(body);

  factory BeginTrackingIMAPEnvelope.fromMap(Map<String, dynamic> data) =>
      BeginTrackingIMAPEnvelope(BeginTrackingIMAPBody.fromMap(data['Body']),
          header: data['Header'] != null ? SoapHeader.fromMap(data['Header']) : null);

  BeginTrackingIMAPBody get beginTrackingIMAPBody => body as BeginTrackingIMAPBody;
}
