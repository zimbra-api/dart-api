// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import '../../common/type/soap_body.dart';
import 'sync_request.dart';
import 'sync_response.dart';

class SyncBody extends SoapBody {
  SyncBody({
    SyncRequest? request,
    SyncResponse? response,
  }) : super(request: request, response: response);

  factory SyncBody.fromMap(Map<String, dynamic> data) => SyncBody(
        response: data['SyncResponse'] != null
            ? SyncResponse.fromMap(
                data['SyncResponse'],
              )
            : null,
      );

  @override
  Map<String, dynamic> toMap() => {
        if (request != null) 'SyncRequest': request!.toMap(),
      };
}
