// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import '../../common/type/soap_body.dart';
import 'auto_complete_gal_request.dart';
import 'auto_complete_gal_response.dart';

class AutoCompleteGalBody extends SoapBody {
  AutoCompleteGalBody({AutoCompleteGalRequest? request, AutoCompleteGalResponse? response})
      : super(request: request, response: response);

  factory AutoCompleteGalBody.fromMap(Map<String, dynamic> data) => AutoCompleteGalBody(
      response: data['AutoCompleteGalResponse'] != null
          ? AutoCompleteGalResponse.fromMap(data['AutoCompleteGalResponse'])
          : null);

  @override
  Map<String, dynamic> toMap() => {
        if (request != null) 'AutoCompleteGalRequest': request!.toMap(),
      };
}
