// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_body.dart';
import 'package:zimbra_api/src/common/type/soap_fault.dart';

import 'empty_dumpster_request.dart';
import 'empty_dumpster_response.dart';

class EmptyDumpsterBody extends SoapBody {
  EmptyDumpsterBody({EmptyDumpsterRequest? request, EmptyDumpsterResponse? response, super.fault})
      : super(request: request, response: response);

  factory EmptyDumpsterBody.fromJson(Map<String, dynamic> json) => EmptyDumpsterBody(
      response:
          json['EmptyDumpsterResponse'] != null ? EmptyDumpsterResponse.fromJson(json['EmptyDumpsterResponse']) : null,
      fault: json['Fault'] != null ? SoapFault.fromJson(json['Fault']) : null);

  EmptyDumpsterRequest? get emptyDumpsterRequest => request as EmptyDumpsterRequest?;

  EmptyDumpsterResponse? get emptyDumpsterResponse => response as EmptyDumpsterResponse?;

  @override
  Map<String, dynamic> toJson() => {
        if (request != null) 'EmptyDumpsterRequest': request!.toJson(),
      };
}
