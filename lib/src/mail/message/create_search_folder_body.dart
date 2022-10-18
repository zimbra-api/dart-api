// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_body.dart';
import 'package:zimbra_api/src/common/type/soap_fault.dart';

import 'create_search_folder_request.dart';
import 'create_search_folder_response.dart';

class CreateSearchFolderBody extends SoapBody {
  CreateSearchFolderBody({CreateSearchFolderRequest? request, CreateSearchFolderResponse? response, super.fault})
      : super(request: request, response: response);

  factory CreateSearchFolderBody.fromJson(Map<String, dynamic> json) => CreateSearchFolderBody(
      response: json['CreateSearchFolderResponse'] != null
          ? CreateSearchFolderResponse.fromJson(json['CreateSearchFolderResponse'])
          : null,
      fault: json['Fault'] != null ? SoapFault.fromJson(json['Fault']) : null);

  CreateSearchFolderRequest? get createSearchFolderRequest => request as CreateSearchFolderRequest?;

  CreateSearchFolderResponse? get createSearchFolderResponse => response as CreateSearchFolderResponse?;

  @override
  Map<String, dynamic> toJson() => {
        if (request != null) 'CreateSearchFolderRequest': request!.toJson(),
      };
}
