// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_body.dart';

import 'modify_white_black_list_request.dart';
import 'modify_white_black_list_response.dart';

class ModifyWhiteBlackListBody extends SoapBody {
  ModifyWhiteBlackListBody({ModifyWhiteBlackListRequest? request, ModifyWhiteBlackListResponse? response})
      : super(request: request, response: response);

  factory ModifyWhiteBlackListBody.fromMap(Map<String, dynamic> data) => ModifyWhiteBlackListBody(
      response: data['ModifyWhiteBlackListResponse'] != null
          ? ModifyWhiteBlackListResponse.fromMap(data['ModifyWhiteBlackListResponse'])
          : null);

  @override
  Map<String, dynamic> toMap() => {
        if (request != null) 'ModifyWhiteBlackListRequest': request!.toMap(),
      };
}
