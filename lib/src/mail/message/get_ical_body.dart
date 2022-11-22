// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import '../../common/type/soap_body.dart';
import 'get_ical_request.dart';
import 'get_ical_response.dart';

class GetICalBody extends SoapBody {
  GetICalBody({GetICalRequest? request, GetICalResponse? response})
      : super(request: request, response: response);

  factory GetICalBody.fromMap(Map<String, dynamic> data) => GetICalBody(
      response: data['GetICalResponse'] != null ? GetICalResponse.fromMap(data['GetICalResponse']) : null);

  @override
  Map<String, dynamic> toMap() => {
        if (request != null) 'GetICalRequest': request!.toMap(),
      };
}
