// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_body.dart';
import 'package:zimbra_api/src/common/type/soap_fault.dart';

import 'create_tag_request.dart';
import 'create_tag_response.dart';

class CreateTagBody extends SoapBody {
  CreateTagBody({CreateTagRequest? request, CreateTagResponse? response, super.fault})
      : super(request: request, response: response);

  factory CreateTagBody.fromJson(Map<String, dynamic> json) => CreateTagBody(
      response: json['CreateTagResponse'] != null ? CreateTagResponse.fromJson(json['CreateTagResponse']) : null,
      fault: json['Fault'] != null ? SoapFault.fromJson(json['Fault']) : null);

  CreateTagRequest? get createTagRequest => request as CreateTagRequest?;

  CreateTagResponse? get createTagResponse => response as CreateTagResponse?;

  @override
  Map<String, dynamic> toJson() => {
        if (request != null) 'CreateTagRequest': request!.toJson(),
      };
}
