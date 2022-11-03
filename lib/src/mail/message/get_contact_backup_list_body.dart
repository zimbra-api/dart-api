// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_body.dart';

import 'get_contact_backup_list_request.dart';
import 'get_contact_backup_list_response.dart';

class GetContactBackupListBody extends SoapBody {
  GetContactBackupListBody({GetContactBackupListRequest? request, GetContactBackupListResponse? response})
      : super(request: request, response: response);

  factory GetContactBackupListBody.fromMap(Map<String, dynamic> data) => GetContactBackupListBody(
      response: data['GetContactBackupListResponse'] != null
          ? GetContactBackupListResponse.fromMap(data['GetContactBackupListResponse'])
          : null);

  @override
  Map<String, dynamic> toMap() => {
        if (request != null) 'GetContactBackupListRequest': request!.toMap(),
      };
}
