// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_body.dart';
import 'package:zimbra_api/src/common/type/soap_fault.dart';

import 'search_action_request.dart';
import 'search_action_response.dart';

class SearchActionBody extends SoapBody {
  SearchActionBody({SearchActionRequest? request, SearchActionResponse? response, super.fault})
      : super(request: request, response: response);

  factory SearchActionBody.fromJson(Map<String, dynamic> json) => SearchActionBody(
      response:
          json['SearchActionResponse'] != null ? SearchActionResponse.fromJson(json['SearchActionResponse']) : null,
      fault: json['Fault'] != null ? SoapFault.fromJson(json['Fault']) : null);

  SearchActionRequest? get searchActionRequest => request as SearchActionRequest?;

  SearchActionResponse? get searchActionResponse => response as SearchActionResponse?;

  @override
  Map<String, dynamic> toJson() => {
        if (request != null) 'SearchActionRequest': request!.toJson(),
      };
}
