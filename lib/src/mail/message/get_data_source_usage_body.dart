// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import '../../common/type/soap_body.dart';
import 'get_data_source_usage_request.dart';
import 'get_data_source_usage_response.dart';

class GetDataSourceUsageBody extends SoapBody {
  GetDataSourceUsageBody({GetDataSourceUsageRequest? request, GetDataSourceUsageResponse? response})
      : super(request: request, response: response);

  factory GetDataSourceUsageBody.fromMap(Map<String, dynamic> data) => GetDataSourceUsageBody(
      response: data['GetDataSourceUsageResponse'] != null
          ? GetDataSourceUsageResponse.fromMap(data['GetDataSourceUsageResponse'])
          : null);

  @override
  Map<String, dynamic> toMap() => {
        if (request != null) 'GetDataSourceUsageRequest': request!.toMap(),
      };
}
