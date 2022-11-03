// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_body.dart';

import 'import_contacts_request.dart';
import 'import_contacts_response.dart';

class ImportContactsBody extends SoapBody {
  ImportContactsBody({ImportContactsRequest? request, ImportContactsResponse? response})
      : super(request: request, response: response);

  factory ImportContactsBody.fromMap(Map<String, dynamic> data) => ImportContactsBody(
      response: data['ImportContactsResponse'] != null
          ? ImportContactsResponse.fromMap(data['ImportContactsResponse'])
          : null);

  @override
  Map<String, dynamic> toMap() => {
        if (request != null) 'ImportContactsRequest': request!.toMap(),
      };
}
