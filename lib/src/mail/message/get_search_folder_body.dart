// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_body.dart';
import 'package:zimbra_api/src/common/type/soap_fault.dart';

import 'get_search_folder_request.dart';
import 'get_search_folder_response.dart';

class GetSearchFolderBody extends SoapBody {
  GetSearchFolderBody({GetSearchFolderRequest? request, GetSearchFolderResponse? response, super.fault})
      : super(request: request, response: response);

  factory GetSearchFolderBody.fromJson(Map<String, dynamic> json) => GetSearchFolderBody(
      response: json['GetSearchFolderResponse'] != null
          ? GetSearchFolderResponse.fromJson(json['GetSearchFolderResponse'])
          : null,
      fault: json['Fault'] != null ? SoapFault.fromJson(json['Fault']) : null);

  GetSearchFolderRequest? get getSearchFolderRequest => request as GetSearchFolderRequest?;

  GetSearchFolderResponse? get getSearchFolderResponse => response as GetSearchFolderResponse?;

  @override
  Map<String, dynamic> toJson() => {
        if (request != null) 'GetSearchFolderRequest': request!.toJson(),
      };
}
