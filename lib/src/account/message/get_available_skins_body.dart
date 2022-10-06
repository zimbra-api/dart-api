// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_body.dart';
import 'package:zimbra_api/src/common/type/soap_fault.dart';

import 'get_available_skins_request.dart';
import 'get_available_skins_response.dart';

class GetAvailableSkinsBody extends SoapBody {
  GetAvailableSkinsBody({GetAvailableSkinsRequest? request, GetAvailableSkinsResponse? response, super.fault})
      : super(request: request, response: response);

  factory GetAvailableSkinsBody.fromJson(Map<String, dynamic> json) => GetAvailableSkinsBody(
      response: json['GetAvailableSkinsResponse'] != null
          ? GetAvailableSkinsResponse.fromJson(json['GetAvailableSkinsResponse'])
          : null,
      fault: json['Fault'] != null ? SoapFault.fromJson(json['Fault']) : null);

  GetAvailableSkinsRequest? get getAvailableSkinsRequest => request as GetAvailableSkinsRequest;

  GetAvailableSkinsResponse? get getAvailableSkinsResponse => response as GetAvailableSkinsResponse;

  @override
  Map<String, dynamic> toJson() => {
        if (request != null) 'GetAvailableSkinsRequest': request!.toJson(),
      };
}
