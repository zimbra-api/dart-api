// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_body.dart';
import 'package:zimbra_api/src/common/type/soap_fault.dart';

import 'set_custom_metadata_request.dart';
import 'set_custom_metadata_response.dart';

class SetCustomMetadataBody extends SoapBody {
  SetCustomMetadataBody({SetCustomMetadataRequest? request, SetCustomMetadataResponse? response, super.fault})
      : super(request: request, response: response);

  factory SetCustomMetadataBody.fromMap(Map<String, dynamic> data) => SetCustomMetadataBody(
      response: data['SetCustomMetadataResponse'] != null
          ? SetCustomMetadataResponse.fromMap(data['SetCustomMetadataResponse'])
          : null,
      fault: data['Fault'] != null ? SoapFault.fromMap(data['Fault']) : null);

  SetCustomMetadataRequest? get setCustomMetadataRequest => request as SetCustomMetadataRequest?;

  SetCustomMetadataResponse? get setCustomMetadataResponse => response as SetCustomMetadataResponse?;

  @override
  Map<String, dynamic> toMap() => {
        if (request != null) 'SetCustomMetadataRequest': request!.toMap(),
      };
}
