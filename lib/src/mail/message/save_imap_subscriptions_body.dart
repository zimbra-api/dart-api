// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_body.dart';

import 'save_imap_subscriptions_request.dart';
import 'save_imap_subscriptions_response.dart';

class SaveIMAPSubscriptionsBody extends SoapBody {
  SaveIMAPSubscriptionsBody(
      {SaveIMAPSubscriptionsRequest? request, SaveIMAPSubscriptionsResponse? response})
      : super(request: request, response: response);

  factory SaveIMAPSubscriptionsBody.fromMap(Map<String, dynamic> data) => SaveIMAPSubscriptionsBody(
      response: data['SaveIMAPSubscriptionsResponse'] != null
          ? SaveIMAPSubscriptionsResponse.fromMap(data['SaveIMAPSubscriptionsResponse'])
          : null);

  @override
  Map<String, dynamic> toMap() => {
        if (request != null) 'SaveIMAPSubscriptionsRequest': request!.toMap(),
      };
}
