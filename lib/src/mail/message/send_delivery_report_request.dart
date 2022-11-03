// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_header.dart';
import 'package:zimbra_api/src/common/type/soap_envelope.dart';
import 'package:zimbra_api/src/common/type/soap_request.dart';

import 'send_delivery_report_body.dart';
import 'send_delivery_report_envelope.dart';

/// Send a delivery report
class SendDeliveryReportRequest extends SoapRequest {
  /// Message ID
  final String messageId;

  SendDeliveryReportRequest(this.messageId);

  @override
  SoapEnvelope getEnvelope({SoapHeader? header}) =>
      SendDeliveryReportEnvelope(SendDeliveryReportBody(request: this), header: header);

  @override
  Map<String, dynamic> toMap() => {
        '_jsns': 'urn:zimbraMail',
        'mid': messageId,
      };
}
