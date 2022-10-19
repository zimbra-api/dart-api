// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_body.dart';
import 'package:zimbra_api/src/common/type/soap_fault.dart';

import 'get_contact_backup_list_request.dart';
import 'get_contact_backup_list_response.dart';

class GetContactBackupListBody extends SoapBody {
  GetContactBackupListBody({GetContactBackupListRequest? request, GetContactBackupListResponse? response, super.fault})
      : super(request: request, response: response);

  factory GetContactBackupListBody.fromJson(Map<String, dynamic> json) => GetContactBackupListBody(
      response: json['GetContactBackupListResponse'] != null
          ? GetContactBackupListResponse.fromJson(json['GetContactBackupListResponse'])
          : null,
      fault: json['Fault'] != null ? SoapFault.fromJson(json['Fault']) : null);

  GetContactBackupListRequest? get getContactBackupListRequest => request as GetContactBackupListRequest?;

  GetContactBackupListResponse? get getContactBackupListResponse => response as GetContactBackupListResponse?;

  @override
  Map<String, dynamic> toJson() => {
        if (request != null) 'GetContactBackupListRequest': request!.toJson(),
      };
}
