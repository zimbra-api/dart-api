// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import '../../common/type/soap_body.dart';
import 'browse_request.dart';
import 'browse_response.dart';

class BrowseBody extends SoapBody {
  BrowseBody({
    BrowseRequest? request,
    BrowseResponse? response,
  }) : super(request: request, response: response);

  factory BrowseBody.fromMap(Map<String, dynamic> data) => BrowseBody(
        response: data['BrowseResponse'] != null
            ? BrowseResponse.fromMap(
                data['BrowseResponse'],
              )
            : null,
      );

  @override
  Map<String, dynamic> toMap() => {
        if (request != null) 'BrowseRequest': request!.toMap(),
      };
}
