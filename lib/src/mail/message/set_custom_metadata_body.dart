// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.
// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.
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

  factory SetCustomMetadataBody.fromJson(Map<String, dynamic> json) => SetCustomMetadataBody(
      response: json['SetCustomMetadataResponse'] != null
          ? SetCustomMetadataResponse.fromJson(json['SetCustomMetadataResponse'])
          : null,
      fault: json['Fault'] != null ? SoapFault.fromJson(json['Fault']) : null);

  SetCustomMetadataRequest? get setCustomMetadataRequest => request as SetCustomMetadataRequest?;

  SetCustomMetadataResponse? get setCustomMetadataResponse => response as SetCustomMetadataResponse?;

  @override
  Map<String, dynamic> toJson() => {
        if (request != null) 'SetCustomMetadataRequest': request!.toJson(),
      };
}
