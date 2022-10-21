// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_body.dart';
import 'package:zimbra_api/src/common/type/soap_fault.dart';

import 'get_folder_request.dart';
import 'get_folder_response.dart';

class GetFolderBody extends SoapBody {
  GetFolderBody({GetFolderRequest? request, GetFolderResponse? response, super.fault})
      : super(request: request, response: response);

  factory GetFolderBody.fromJson(Map<String, dynamic> json) => GetFolderBody(
      response: json['GetFolderResponse'] != null ? GetFolderResponse.fromJson(json['GetFolderResponse']) : null,
      fault: json['Fault'] != null ? SoapFault.fromJson(json['Fault']) : null);

  GetFolderRequest? get getFolderRequest => request as GetFolderRequest?;

  GetFolderResponse? get getFolderResponse => response as GetFolderResponse?;

  @override
  Map<String, dynamic> toJson() => {
        if (request != null) 'GetFolderRequest': request!.toJson(),
      };
}
