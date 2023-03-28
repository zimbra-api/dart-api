// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import '../../common/type/soap_header.dart';
import '../../common/type/soap_envelope.dart';
import '../../common/type/soap_request.dart';
import 'begin_tracking_imap_body.dart';
import 'begin_tracking_imap_envelope.dart';

class BeginTrackingIMAPRequest extends SoapRequest {
  @override
  SoapEnvelope getEnvelope({SoapHeader? header}) => BeginTrackingIMAPEnvelope(
        BeginTrackingIMAPBody(request: this),
        header: header,
      );

  @override
  Map<String, dynamic> toMap() => {
        '_jsns': 'urn:zimbraMail',
      };
}
