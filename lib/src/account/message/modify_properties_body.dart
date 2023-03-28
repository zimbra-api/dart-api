// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import '../../common/type/soap_body.dart';
import 'modify_properties_request.dart';
import 'modify_properties_response.dart';

class ModifyPropertiesBody extends SoapBody {
  ModifyPropertiesBody({
    ModifyPropertiesRequest? request,
    ModifyPropertiesResponse? response,
  }) : super(request: request, response: response);

  factory ModifyPropertiesBody.fromMap(
    Map<String, dynamic> data,
  ) =>
      ModifyPropertiesBody(
        response: data['ModifyPropertiesResponse'] != null
            ? ModifyPropertiesResponse.fromMap(
                data['ModifyPropertiesResponse'],
              )
            : null,
      );

  @override
  Map<String, dynamic> toMap() => {
        if (request != null) 'ModifyPropertiesRequest': request!.toMap(),
      };
}
