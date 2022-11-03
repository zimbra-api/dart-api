// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_body.dart';

import 'recover_account_request.dart';
import 'recover_account_response.dart';

class RecoverAccountBody extends SoapBody {
  RecoverAccountBody({RecoverAccountRequest? request, RecoverAccountResponse? response})
      : super(request: request, response: response);

  factory RecoverAccountBody.fromMap(Map<String, dynamic> data) => RecoverAccountBody(
      response: data['RecoverAccountResponse'] != null
          ? RecoverAccountResponse.fromMap(data['RecoverAccountResponse'])
          : null);

  @override
  Map<String, dynamic> toMap() => {
        if (request != null) 'RecoverAccountRequest': request!.toMap(),
      };
}
