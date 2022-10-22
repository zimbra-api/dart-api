// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_body.dart';
import 'package:zimbra_api/src/common/type/soap_fault.dart';

import 'list_imap_subscriptions_request.dart';
import 'list_imap_subscriptions_response.dart';

class ListIMAPSubscriptionsBody extends SoapBody {
  ListIMAPSubscriptionsBody(
      {ListIMAPSubscriptionsRequest? request, ListIMAPSubscriptionsResponse? response, super.fault})
      : super(request: request, response: response);

  factory ListIMAPSubscriptionsBody.fromJson(Map<String, dynamic> json) => ListIMAPSubscriptionsBody(
      response: json['ListIMAPSubscriptionsResponse'] != null
          ? ListIMAPSubscriptionsResponse.fromJson(json['ListIMAPSubscriptionsResponse'])
          : null,
      fault: json['Fault'] != null ? SoapFault.fromJson(json['Fault']) : null);

  ListIMAPSubscriptionsRequest? get listIMAPSubscriptionsRequest => request as ListIMAPSubscriptionsRequest?;

  ListIMAPSubscriptionsResponse? get listIMAPSubscriptionsResponse => response as ListIMAPSubscriptionsResponse?;

  @override
  Map<String, dynamic> toJson() => {
        if (request != null) 'ListIMAPSubscriptionsRequest': request!.toJson(),
      };
}
