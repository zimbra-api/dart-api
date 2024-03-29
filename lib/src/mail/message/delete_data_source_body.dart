// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import '../../common/type/soap_body.dart';
import 'delete_data_source_request.dart';
import 'delete_data_source_response.dart';

class DeleteDataSourceBody extends SoapBody {
  DeleteDataSourceBody({
    DeleteDataSourceRequest? request,
    DeleteDataSourceResponse? response,
  }) : super(request: request, response: response);

  factory DeleteDataSourceBody.fromMap(
    Map<String, dynamic> data,
  ) =>
      DeleteDataSourceBody(
        response: data['DeleteDataSourceResponse'] != null
            ? DeleteDataSourceResponse.fromMap(
                data['DeleteDataSourceResponse'],
              )
            : null,
      );

  @override
  Map<String, dynamic> toMap() => {
        if (request != null) 'DeleteDataSourceRequest': request!.toMap(),
      };
}
