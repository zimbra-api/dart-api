// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import '../../common/type/soap_body.dart';
import 'check_spelling_request.dart';
import 'check_spelling_response.dart';

class CheckSpellingBody extends SoapBody {
  CheckSpellingBody({CheckSpellingRequest? request, CheckSpellingResponse? response})
      : super(request: request, response: response);

  factory CheckSpellingBody.fromMap(Map<String, dynamic> data) => CheckSpellingBody(
      response:
          data['CheckSpellingResponse'] != null ? CheckSpellingResponse.fromMap(data['CheckSpellingResponse']) : null);

  @override
  Map<String, dynamic> toMap() => {
        if (request != null) 'CheckSpellingRequest': request!.toMap(),
      };
}
