// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import '../../common/type/soap_body.dart';
import 'send_delivery_report_request.dart';
import 'send_delivery_report_response.dart';

class SendDeliveryReportBody extends SoapBody {
  SendDeliveryReportBody({SendDeliveryReportRequest? request, SendDeliveryReportResponse? response})
      : super(request: request, response: response);

  factory SendDeliveryReportBody.fromMap(Map<String, dynamic> data) => SendDeliveryReportBody(
      response: data['SendDeliveryReportResponse'] != null
          ? SendDeliveryReportResponse.fromMap(data['SendDeliveryReportResponse'])
          : null);

  @override
  Map<String, dynamic> toMap() => {
        if (request != null) 'SendDeliveryReportRequest': request!.toMap(),
      };
}
