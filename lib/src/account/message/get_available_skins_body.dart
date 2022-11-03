// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_body.dart';

import 'get_available_skins_request.dart';
import 'get_available_skins_response.dart';

class GetAvailableSkinsBody extends SoapBody {
  GetAvailableSkinsBody({GetAvailableSkinsRequest? request, GetAvailableSkinsResponse? response})
      : super(request: request, response: response);

  factory GetAvailableSkinsBody.fromMap(Map<String, dynamic> data) => GetAvailableSkinsBody(
      response: data['GetAvailableSkinsResponse'] != null
          ? GetAvailableSkinsResponse.fromMap(data['GetAvailableSkinsResponse'])
          : null);

  @override
  Map<String, dynamic> toMap() => {
        if (request != null) 'GetAvailableSkinsRequest': request!.toMap(),
      };
}
