// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_body.dart';
import 'package:zimbra_api/src/common/type/soap_fault.dart';

import 'search_request.dart';
import 'search_response.dart';

class SearchBody extends SoapBody {
  SearchBody({SearchRequest? request, SearchResponse? response, super.fault})
      : super(request: request, response: response);

  factory SearchBody.fromJson(Map<String, dynamic> json) => SearchBody(
      response: json['SearchResponse'] != null ? SearchResponse.fromJson(json['SearchResponse']) : null,
      fault: json['Fault'] != null ? SoapFault.fromJson(json['Fault']) : null);

  SearchRequest? get searchRequest => request as SearchRequest?;

  SearchResponse? get searchResponse => response as SearchResponse?;

  @override
  Map<String, dynamic> toJson() => {
        if (request != null) 'SearchRequest': request!.toJson(),
      };
}
