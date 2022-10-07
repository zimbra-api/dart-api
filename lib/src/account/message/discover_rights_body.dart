// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_body.dart';
import 'package:zimbra_api/src/common/type/soap_fault.dart';

import 'discover_rights_request.dart';
import 'discover_rights_response.dart';

class DiscoverRightsBody extends SoapBody {
  DiscoverRightsBody({DiscoverRightsRequest? request, DiscoverRightsResponse? response, super.fault})
      : super(request: request, response: response);

  factory DiscoverRightsBody.fromJson(Map<String, dynamic> json) => DiscoverRightsBody(
      response: json['DiscoverRightsResponse'] != null
          ? DiscoverRightsResponse.fromJson(json['DiscoverRightsResponse'])
          : null,
      fault: json['Fault'] != null ? SoapFault.fromJson(json['Fault']) : null);

  DiscoverRightsRequest? get discoverRightsRequest => request as DiscoverRightsRequest?;

  DiscoverRightsResponse? get discoverRightsResponse => response as DiscoverRightsResponse?;

  @override
  Map<String, dynamic> toJson() => {
        if (request != null) 'DiscoverRightsRequest': request!.toJson(),
      };
}
