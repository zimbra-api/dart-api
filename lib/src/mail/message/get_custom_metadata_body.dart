// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_body.dart';
import 'package:zimbra_api/src/common/type/soap_fault.dart';

import 'get_custom_metadata_request.dart';
import 'get_custom_metadata_response.dart';

class GetCustomMetadataBody extends SoapBody {
  GetCustomMetadataBody({GetCustomMetadataRequest? request, GetCustomMetadataResponse? response, super.fault})
      : super(request: request, response: response);

  factory GetCustomMetadataBody.fromJson(Map<String, dynamic> json) => GetCustomMetadataBody(
      response: json['GetCustomMetadataResponse'] != null
          ? GetCustomMetadataResponse.fromJson(json['GetCustomMetadataResponse'])
          : null,
      fault: json['Fault'] != null ? SoapFault.fromJson(json['Fault']) : null);

  GetCustomMetadataRequest? get getCustomMetadataRequest => request as GetCustomMetadataRequest?;

  GetCustomMetadataResponse? get getCustomMetadataResponse => response as GetCustomMetadataResponse?;

  @override
  Map<String, dynamic> toJson() => {
        if (request != null) 'GetCustomMetadataRequest': request!.toJson(),
      };
}
