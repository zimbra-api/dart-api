// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_body.dart';
import 'package:zimbra_api/src/common/type/soap_fault.dart';

import 'get_share_notifications_request.dart';
import 'get_share_notifications_response.dart';

class GetShareNotificationsBody extends SoapBody {
  GetShareNotificationsBody(
      {GetShareNotificationsRequest? request, GetShareNotificationsResponse? response, super.fault})
      : super(request: request, response: response);

  factory GetShareNotificationsBody.fromMap(Map<String, dynamic> data) => GetShareNotificationsBody(
      response: data['GetShareNotificationsResponse'] != null
          ? GetShareNotificationsResponse.fromMap(data['GetShareNotificationsResponse'])
          : null,
      fault: data['Fault'] != null ? SoapFault.fromMap(data['Fault']) : null);

  @override
  Map<String, dynamic> toMap() => {
        if (request != null) 'GetShareNotificationsRequest': request!.toMap(),
      };
}
