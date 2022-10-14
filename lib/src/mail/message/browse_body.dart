// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_body.dart';
import 'package:zimbra_api/src/common/type/soap_fault.dart';

import 'browse_request.dart';
import 'browse_response.dart';

class BrowseBody extends SoapBody {
  BrowseBody({BrowseRequest? request, BrowseResponse? response, super.fault})
      : super(request: request, response: response);

  factory BrowseBody.fromJson(Map<String, dynamic> json) => BrowseBody(
      response: json['BrowseResponse'] != null ? BrowseResponse.fromJson(json['BrowseResponse']) : null,
      fault: json['Fault'] != null ? SoapFault.fromJson(json['Fault']) : null);

  BrowseRequest? get browseRequest => request as BrowseRequest?;

  BrowseResponse? get browseResponse => response as BrowseResponse?;

  @override
  Map<String, dynamic> toJson() => {
        if (request != null) 'BrowseRequest': request!.toJson(),
      };
}
