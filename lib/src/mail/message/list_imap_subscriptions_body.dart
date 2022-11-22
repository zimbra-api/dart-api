// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import '../../common/type/soap_body.dart';
import 'list_imap_subscriptions_request.dart';
import 'list_imap_subscriptions_response.dart';

class ListIMAPSubscriptionsBody extends SoapBody {
  ListIMAPSubscriptionsBody(
      {ListIMAPSubscriptionsRequest? request, ListIMAPSubscriptionsResponse? response})
      : super(request: request, response: response);

  factory ListIMAPSubscriptionsBody.fromMap(Map<String, dynamic> data) => ListIMAPSubscriptionsBody(
      response: data['ListIMAPSubscriptionsResponse'] != null
          ? ListIMAPSubscriptionsResponse.fromMap(data['ListIMAPSubscriptionsResponse'])
          : null);

  @override
  Map<String, dynamic> toMap() => {
        if (request != null) 'ListIMAPSubscriptionsRequest': request!.toMap(),
      };
}
