// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_body.dart';
import 'package:zimbra_api/src/common/type/soap_fault.dart';

import 'sync_request.dart';
import 'sync_response.dart';

class SyncBody extends SoapBody {
  SyncBody({SyncRequest? request, SyncResponse? response, super.fault}) : super(request: request, response: response);

  factory SyncBody.fromJson(Map<String, dynamic> json) => SyncBody(
      response: json['SyncResponse'] != null ? SyncResponse.fromJson(json['SyncResponse']) : null,
      fault: json['Fault'] != null ? SoapFault.fromJson(json['Fault']) : null);

  SyncRequest? get syncRequest => request as SyncRequest?;

  SyncResponse? get syncResponse => response as SyncResponse?;

  @override
  Map<String, dynamic> toJson() => {
        if (request != null) 'SyncRequest': request!.toJson(),
      };
}
