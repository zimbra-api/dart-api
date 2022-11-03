// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_body.dart';

import 'get_comments_request.dart';
import 'get_comments_response.dart';

class GetCommentsBody extends SoapBody {
  GetCommentsBody({GetCommentsRequest? request, GetCommentsResponse? response})
      : super(request: request, response: response);

  factory GetCommentsBody.fromMap(Map<String, dynamic> data) => GetCommentsBody(
      response: data['GetCommentsResponse'] != null ? GetCommentsResponse.fromMap(data['GetCommentsResponse']) : null);

  @override
  Map<String, dynamic> toMap() => {
        if (request != null) 'GetCommentsRequest': request!.toMap(),
      };
}
