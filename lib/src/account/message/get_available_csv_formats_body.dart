// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import '../../common/type/soap_body.dart';
import 'get_available_csv_formats_request.dart';
import 'get_available_csv_formats_response.dart';

class GetAvailableCsvFormatsBody extends SoapBody {
  GetAvailableCsvFormatsBody(
      {GetAvailableCsvFormatsRequest? request, GetAvailableCsvFormatsResponse? response})
      : super(request: request, response: response);

  factory GetAvailableCsvFormatsBody.fromMap(Map<String, dynamic> data) => GetAvailableCsvFormatsBody(
      response: data['GetAvailableCsvFormatsResponse'] != null
          ? GetAvailableCsvFormatsResponse.fromMap(data['GetAvailableCsvFormatsResponse'])
          : null);

  @override
  Map<String, dynamic> toMap() => {
        if (request != null) 'GetAvailableCsvFormatsRequest': request!.toMap(),
      };
}
