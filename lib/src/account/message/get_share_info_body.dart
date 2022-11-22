// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import '../../common/type/soap_body.dart';
import 'get_share_info_request.dart';
import 'get_share_info_response.dart';

class GetShareInfoBody extends SoapBody {
  GetShareInfoBody({GetShareInfoRequest? request, GetShareInfoResponse? response})
      : super(request: request, response: response);

  factory GetShareInfoBody.fromMap(Map<String, dynamic> data) => GetShareInfoBody(
      response:
          data['GetShareInfoResponse'] != null ? GetShareInfoResponse.fromMap(data['GetShareInfoResponse']) : null);

  @override
  Map<String, dynamic> toMap() => {
        if (request != null) 'GetShareInfoRequest': request!.toMap(),
      };
}
