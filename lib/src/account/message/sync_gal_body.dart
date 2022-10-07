// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_body.dart';
import 'package:zimbra_api/src/common/type/soap_fault.dart';

import 'sync_gal_request.dart';
import 'sync_gal_response.dart';

class SyncGalBody extends SoapBody {
  SyncGalBody({SyncGalRequest? request, SyncGalResponse? response, super.fault})
      : super(request: request, response: response);

  factory SyncGalBody.fromJson(Map<String, dynamic> json) => SyncGalBody(
      response: json['SyncGalResponse'] != null ? SyncGalResponse.fromJson(json['SyncGalResponse']) : null,
      fault: json['Fault'] != null ? SoapFault.fromJson(json['Fault']) : null);

  SyncGalRequest? get syncGalRequest => request as SyncGalRequest?;

  SyncGalResponse? get syncGalResponse => response as SyncGalResponse?;

  @override
  Map<String, dynamic> toJson() => {
        if (request != null) 'SyncGalRequest': request!.toJson(),
      };
}
