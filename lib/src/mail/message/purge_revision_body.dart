// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_body.dart';
import 'package:zimbra_api/src/common/type/soap_fault.dart';

import 'purge_revision_request.dart';
import 'purge_revision_response.dart';

class PurgeRevisionBody extends SoapBody {
  PurgeRevisionBody({PurgeRevisionRequest? request, PurgeRevisionResponse? response, super.fault})
      : super(request: request, response: response);

  factory PurgeRevisionBody.fromMap(Map<String, dynamic> data) => PurgeRevisionBody(
      response:
          data['PurgeRevisionResponse'] != null ? PurgeRevisionResponse.fromMap(data['PurgeRevisionResponse']) : null,
      fault: data['Fault'] != null ? SoapFault.fromMap(data['Fault']) : null);

  PurgeRevisionRequest? get purgeRevisionRequest => request as PurgeRevisionRequest?;

  PurgeRevisionResponse? get purgeRevisionResponse => response as PurgeRevisionResponse?;

  @override
  Map<String, dynamic> toMap() => {
        if (request != null) 'PurgeRevisionRequest': request!.toMap(),
      };
}
