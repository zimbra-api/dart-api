// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_body.dart';

import 'search_request.dart';
import 'search_response.dart';

class SearchBody extends SoapBody {
  SearchBody({SearchRequest? request, SearchResponse? response})
      : super(request: request, response: response);

  factory SearchBody.fromMap(Map<String, dynamic> data) => SearchBody(
      response: data['SearchResponse'] != null ? SearchResponse.fromMap(data['SearchResponse']) : null);

  @override
  Map<String, dynamic> toMap() => {
        if (request != null) 'SearchRequest': request!.toMap(),
      };
}
