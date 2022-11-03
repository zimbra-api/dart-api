// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_body.dart';

import 'discover_rights_request.dart';
import 'discover_rights_response.dart';

class DiscoverRightsBody extends SoapBody {
  DiscoverRightsBody({DiscoverRightsRequest? request, DiscoverRightsResponse? response})
      : super(request: request, response: response);

  factory DiscoverRightsBody.fromMap(Map<String, dynamic> data) => DiscoverRightsBody(
      response: data['DiscoverRightsResponse'] != null
          ? DiscoverRightsResponse.fromMap(data['DiscoverRightsResponse'])
          : null);

  @override
  Map<String, dynamic> toMap() => {
        if (request != null) 'DiscoverRightsRequest': request!.toMap(),
      };
}
