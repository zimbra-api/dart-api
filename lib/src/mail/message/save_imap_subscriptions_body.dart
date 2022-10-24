// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_body.dart';
import 'package:zimbra_api/src/common/type/soap_fault.dart';

import 'save_imap_subscriptions_request.dart';
import 'save_imap_subscriptions_response.dart';

class SaveIMAPSubscriptionsBody extends SoapBody {
  SaveIMAPSubscriptionsBody(
      {SaveIMAPSubscriptionsRequest? request, SaveIMAPSubscriptionsResponse? response, super.fault})
      : super(request: request, response: response);

  factory SaveIMAPSubscriptionsBody.fromJson(Map<String, dynamic> json) => SaveIMAPSubscriptionsBody(
      response: json['SaveIMAPSubscriptionsResponse'] != null
          ? SaveIMAPSubscriptionsResponse.fromJson(json['SaveIMAPSubscriptionsResponse'])
          : null,
      fault: json['Fault'] != null ? SoapFault.fromJson(json['Fault']) : null);

  SaveIMAPSubscriptionsRequest? get saveIMAPSubscriptionsRequest => request as SaveIMAPSubscriptionsRequest?;

  SaveIMAPSubscriptionsResponse? get saveIMAPSubscriptionsResponse => response as SaveIMAPSubscriptionsResponse?;

  @override
  Map<String, dynamic> toJson() => {
        if (request != null) 'SaveIMAPSubscriptionsRequest': request!.toJson(),
      };
}
