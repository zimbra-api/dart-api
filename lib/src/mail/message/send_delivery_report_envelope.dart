// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_envelope.dart';
import 'package:zimbra_api/src/common/type/soap_header.dart';

import 'send_delivery_report_body.dart';

class SendDeliveryReportEnvelope extends SoapEnvelope {
  SendDeliveryReportEnvelope(SendDeliveryReportBody body, {super.header}) : super(body);

  factory SendDeliveryReportEnvelope.fromJson(Map<String, dynamic> json) =>
      SendDeliveryReportEnvelope(SendDeliveryReportBody.fromJson(json['Body']),
          header: json['Header'] != null ? SoapHeader.fromJson(json['Header']) : null);

  SendDeliveryReportBody get sendDeliveryReportBody => body as SendDeliveryReportBody;
}
