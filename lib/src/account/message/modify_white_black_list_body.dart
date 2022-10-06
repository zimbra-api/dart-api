// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_body.dart';
import 'package:zimbra_api/src/common/type/soap_fault.dart';

import 'modify_white_black_list_request.dart';
import 'modify_white_black_list_response.dart';

class ModifyWhiteBlackListBody extends SoapBody {
  ModifyWhiteBlackListBody({ModifyWhiteBlackListRequest? request, ModifyWhiteBlackListResponse? response, super.fault})
      : super(request: request, response: response);

  factory ModifyWhiteBlackListBody.fromJson(Map<String, dynamic> json) => ModifyWhiteBlackListBody(
      response: json['ModifyWhiteBlackListResponse'] != null
          ? ModifyWhiteBlackListResponse.fromJson(json['ModifyWhiteBlackListResponse'])
          : null,
      fault: json['Fault'] != null ? SoapFault.fromJson(json['Fault']) : null);

  ModifyWhiteBlackListRequest? get modifyWhiteBlackListRequest => request as ModifyWhiteBlackListRequest;

  ModifyWhiteBlackListResponse? get modifyWhiteBlackListResponse => response as ModifyWhiteBlackListResponse;

  @override
  Map<String, dynamic> toJson() => {
        if (request != null) 'ModifyWhiteBlackListRequest': request!.toJson(),
      };
}
