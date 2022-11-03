// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_body.dart';

import 'get_import_status_request.dart';
import 'get_import_status_response.dart';

class GetImportStatusBody extends SoapBody {
  GetImportStatusBody({GetImportStatusRequest? request, GetImportStatusResponse? response})
      : super(request: request, response: response);

  factory GetImportStatusBody.fromMap(Map<String, dynamic> data) => GetImportStatusBody(
      response: data['GetImportStatusResponse'] != null
          ? GetImportStatusResponse.fromMap(data['GetImportStatusResponse'])
          : null);

  @override
  Map<String, dynamic> toMap() => {
        if (request != null) 'GetImportStatusRequest': request!.toMap(),
      };
}
