// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_body.dart';
import 'package:zimbra_api/src/common/type/soap_fault.dart';

import 'get_import_status_request.dart';
import 'get_import_status_response.dart';

class GetImportStatusBody extends SoapBody {
  GetImportStatusBody({GetImportStatusRequest? request, GetImportStatusResponse? response, super.fault})
      : super(request: request, response: response);

  factory GetImportStatusBody.fromJson(Map<String, dynamic> json) => GetImportStatusBody(
      response: json['GetImportStatusResponse'] != null
          ? GetImportStatusResponse.fromJson(json['GetImportStatusResponse'])
          : null,
      fault: json['Fault'] != null ? SoapFault.fromJson(json['Fault']) : null);

  GetImportStatusRequest? get getImportStatusRequest => request as GetImportStatusRequest?;

  GetImportStatusResponse? get getImportStatusResponse => response as GetImportStatusResponse?;

  @override
  Map<String, dynamic> toJson() => {
        if (request != null) 'GetImportStatusRequest': request!.toJson(),
      };
}
