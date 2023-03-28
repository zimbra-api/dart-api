// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import '../../common/type/soap_body.dart';
import 'no_op_request.dart';
import 'no_op_response.dart';

class NoOpBody extends SoapBody {
  NoOpBody({
    NoOpRequest? request,
    NoOpResponse? response,
  }) : super(request: request, response: response);

  factory NoOpBody.fromMap(Map<String, dynamic> data) => NoOpBody(
        response: data['NoOpResponse'] != null
            ? NoOpResponse.fromMap(
                data['NoOpResponse'],
              )
            : null,
      );

  @override
  Map<String, dynamic> toMap() => {
        if (request != null) 'NoOpRequest': request!.toMap(),
      };
}
