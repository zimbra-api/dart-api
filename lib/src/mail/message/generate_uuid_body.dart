// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import '../../common/type/soap_body.dart';
import 'generate_uuid_request.dart';
import 'generate_uuid_response.dart';

class GenerateUUIDBody extends SoapBody {
  GenerateUUIDBody({
    GenerateUUIDRequest? request,
    GenerateUUIDResponse? response,
  }) : super(request: request, response: response);

  factory GenerateUUIDBody.fromMap(
    Map<String, dynamic> data,
  ) =>
      GenerateUUIDBody(
        response: data['GenerateUUIDResponse'] != null
            ? GenerateUUIDResponse.fromMap(
                data['GenerateUUIDResponse'],
              )
            : null,
      );

  @override
  Map<String, dynamic> toMap() => {
        if (request != null) 'GenerateUUIDRequest': request!.toMap(),
      };
}
