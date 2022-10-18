// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_body.dart';
import 'package:zimbra_api/src/common/type/soap_fault.dart';

import 'delete_data_source_request.dart';
import 'delete_data_source_response.dart';

class DeleteDataSourceBody extends SoapBody {
  DeleteDataSourceBody({DeleteDataSourceRequest? request, DeleteDataSourceResponse? response, super.fault})
      : super(request: request, response: response);

  factory DeleteDataSourceBody.fromJson(Map<String, dynamic> json) => DeleteDataSourceBody(
      response: json['DeleteDataSourceResponse'] != null
          ? DeleteDataSourceResponse.fromJson(json['DeleteDataSourceResponse'])
          : null,
      fault: json['Fault'] != null ? SoapFault.fromJson(json['Fault']) : null);

  DeleteDataSourceRequest? get deleteDataSourceRequest => request as DeleteDataSourceRequest?;

  DeleteDataSourceResponse? get deleteDataSourceResponse => response as DeleteDataSourceResponse?;

  @override
  Map<String, dynamic> toJson() => {
        if (request != null) 'DeleteDataSourceRequest': request!.toJson(),
      };
}