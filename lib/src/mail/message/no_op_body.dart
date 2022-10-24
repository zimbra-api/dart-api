// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_body.dart';
import 'package:zimbra_api/src/common/type/soap_fault.dart';

import 'no_op_request.dart';
import 'no_op_response.dart';

class NoOpBody extends SoapBody {
  NoOpBody({NoOpRequest? request, NoOpResponse? response, super.fault}) : super(request: request, response: response);

  factory NoOpBody.fromJson(Map<String, dynamic> json) => NoOpBody(
      response: json['NoOpResponse'] != null ? NoOpResponse.fromJson(json['NoOpResponse']) : null,
      fault: json['Fault'] != null ? SoapFault.fromJson(json['Fault']) : null);

  NoOpRequest? get noOpRequest => request as NoOpRequest?;

  NoOpResponse? get noOpResponse => response as NoOpResponse?;

  @override
  Map<String, dynamic> toJson() => {
        if (request != null) 'NoOpRequest': request!.toJson(),
      };
}
