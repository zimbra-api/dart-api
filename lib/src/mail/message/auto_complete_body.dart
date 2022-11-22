// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import '../../common/type/soap_body.dart';
import 'auto_complete_request.dart';
import 'auto_complete_response.dart';

class AutoCompleteBody extends SoapBody {
  AutoCompleteBody({AutoCompleteRequest? request, AutoCompleteResponse? response})
      : super(request: request, response: response);

  factory AutoCompleteBody.fromMap(Map<String, dynamic> data) => AutoCompleteBody(
      response:
          data['AutoCompleteResponse'] != null ? AutoCompleteResponse.fromMap(data['AutoCompleteResponse']) : null);

  @override
  Map<String, dynamic> toMap() => {
        if (request != null) 'AutoCompleteRequest': request!.toMap(),
      };
}
