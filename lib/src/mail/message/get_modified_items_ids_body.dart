// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import '../../common/type/soap_body.dart';
import 'get_modified_items_ids_request.dart';
import 'get_modified_items_ids_response.dart';

class GetModifiedItemsIDsBody extends SoapBody {
  GetModifiedItemsIDsBody({GetModifiedItemsIDsRequest? request, GetModifiedItemsIDsResponse? response})
      : super(request: request, response: response);

  factory GetModifiedItemsIDsBody.fromMap(Map<String, dynamic> data) => GetModifiedItemsIDsBody(
      response: data['GetModifiedItemsIDsResponse'] != null
          ? GetModifiedItemsIDsResponse.fromMap(data['GetModifiedItemsIDsResponse'])
          : null);

  @override
  Map<String, dynamic> toMap() => {
        if (request != null) 'GetModifiedItemsIDsRequest': request!.toMap(),
      };
}
