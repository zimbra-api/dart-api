// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_body.dart';

import 'search_action_request.dart';
import 'search_action_response.dart';

class SearchActionBody extends SoapBody {
  SearchActionBody({SearchActionRequest? request, SearchActionResponse? response})
      : super(request: request, response: response);

  factory SearchActionBody.fromMap(Map<String, dynamic> data) => SearchActionBody(
      response:
          data['SearchActionResponse'] != null ? SearchActionResponse.fromMap(data['SearchActionResponse']) : null);

  @override
  Map<String, dynamic> toMap() => {
        if (request != null) 'SearchActionRequest': request!.toMap(),
      };
}
