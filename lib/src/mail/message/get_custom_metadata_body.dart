// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_body.dart';

import 'get_custom_metadata_request.dart';
import 'get_custom_metadata_response.dart';

class GetCustomMetadataBody extends SoapBody {
  GetCustomMetadataBody({GetCustomMetadataRequest? request, GetCustomMetadataResponse? response})
      : super(request: request, response: response);

  factory GetCustomMetadataBody.fromMap(Map<String, dynamic> data) => GetCustomMetadataBody(
      response: data['GetCustomMetadataResponse'] != null
          ? GetCustomMetadataResponse.fromMap(data['GetCustomMetadataResponse'])
          : null);

  @override
  Map<String, dynamic> toMap() => {
        if (request != null) 'GetCustomMetadataRequest': request!.toMap(),
      };
}
