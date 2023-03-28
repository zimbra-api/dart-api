// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import '../../common/type/soap_body.dart';
import 'sync_gal_request.dart';
import 'sync_gal_response.dart';

class SyncGalBody extends SoapBody {
  SyncGalBody({
    SyncGalRequest? request,
    SyncGalResponse? response,
  }) : super(request: request, response: response);

  factory SyncGalBody.fromMap(Map<String, dynamic> data) => SyncGalBody(
        response: data['SyncGalResponse'] != null
            ? SyncGalResponse.fromMap(
                data['SyncGalResponse'],
              )
            : null,
      );

  @override
  Map<String, dynamic> toMap() => {
        if (request != null) 'SyncGalRequest': request!.toMap(),
      };
}
