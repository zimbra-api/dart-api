// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_body.dart';
import 'package:zimbra_api/src/common/type/soap_fault.dart';

import 'send_delivery_report_request.dart';
import 'send_delivery_report_response.dart';

class SendDeliveryReportBody extends SoapBody {
  SendDeliveryReportBody({SendDeliveryReportRequest? request, SendDeliveryReportResponse? response, super.fault})
      : super(request: request, response: response);

  factory SendDeliveryReportBody.fromMap(Map<String, dynamic> data) => SendDeliveryReportBody(
      response: data['SendDeliveryReportResponse'] != null
          ? SendDeliveryReportResponse.fromMap(data['SendDeliveryReportResponse'])
          : null,
      fault: data['Fault'] != null ? SoapFault.fromMap(data['Fault']) : null);

  SendDeliveryReportRequest? get sendDeliveryReportRequest => request as SendDeliveryReportRequest?;

  SendDeliveryReportResponse? get sendDeliveryReportResponse => response as SendDeliveryReportResponse?;

  @override
  Map<String, dynamic> toMap() => {
        if (request != null) 'SendDeliveryReportRequest': request!.toMap(),
      };
}
