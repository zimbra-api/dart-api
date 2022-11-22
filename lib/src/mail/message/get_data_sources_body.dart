// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import '../../common/type/soap_body.dart';
import 'get_data_sources_request.dart';
import 'get_data_sources_response.dart';

class GetDataSourcesBody extends SoapBody {
  GetDataSourcesBody({GetDataSourcesRequest? request, GetDataSourcesResponse? response})
      : super(request: request, response: response);

  factory GetDataSourcesBody.fromMap(Map<String, dynamic> data) => GetDataSourcesBody(
      response: data['GetDataSourcesResponse'] != null
          ? GetDataSourcesResponse.fromMap(data['GetDataSourcesResponse'])
          : null);

  @override
  Map<String, dynamic> toMap() => {
        if (request != null) 'GetDataSourcesRequest': request!.toMap(),
      };
}
