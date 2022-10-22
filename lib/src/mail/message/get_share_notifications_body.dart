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

  factory GetShareNotificationsBody.fromJson(Map<String, dynamic> json) => GetShareNotificationsBody(
      response: json['GetShareNotificationsResponse'] != null
          ? GetShareNotificationsResponse.fromJson(json['GetShareNotificationsResponse'])
          : null,
      fault: json['Fault'] != null ? SoapFault.fromJson(json['Fault']) : null);

  GetShareNotificationsRequest? get getShareNotificationsRequest => request as GetShareNotificationsRequest?;

  GetShareNotificationsResponse? get getShareNotificationsResponse => response as GetShareNotificationsResponse?;

  @override
  Map<String, dynamic> toJson() => {
        if (request != null) 'GetShareNotificationsRequest': request!.toJson(),
      };
}
