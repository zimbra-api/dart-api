// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import '../../common/type/soap_body.dart';
import 'get_tag_request.dart';
import 'get_tag_response.dart';

class GetTagBody extends SoapBody {
  GetTagBody({
    GetTagRequest? request,
    GetTagResponse? response,
  }) : super(request: request, response: response);

  factory GetTagBody.fromMap(Map<String, dynamic> data) => GetTagBody(
        response: data['GetTagResponse'] != null
            ? GetTagResponse.fromMap(
                data['GetTagResponse'],
              )
            : null,
      );

  @override
  Map<String, dynamic> toMap() => {
        if (request != null) 'GetTagRequest': request!.toMap(),
      };
}
