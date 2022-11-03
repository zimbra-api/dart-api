// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_body.dart';

import 'import_data_request.dart';
import 'import_data_response.dart';

class ImportDataBody extends SoapBody {
  ImportDataBody({ImportDataRequest? request, ImportDataResponse? response})
      : super(request: request, response: response);

  factory ImportDataBody.fromMap(Map<String, dynamic> data) => ImportDataBody(
      response: data['ImportDataResponse'] != null ? ImportDataResponse.fromMap(data['ImportDataResponse']) : null);

  @override
  Map<String, dynamic> toMap() => {
        if (request != null) 'ImportDataRequest': request!.toMap(),
      };
}
