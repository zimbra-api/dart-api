// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_body.dart';
import 'package:zimbra_api/src/common/type/soap_fault.dart';

import 'tag_action_request.dart';
import 'tag_action_response.dart';

class TagActionBody extends SoapBody {
  TagActionBody({TagActionRequest? request, TagActionResponse? response, super.fault})
      : super(request: request, response: response);

  factory TagActionBody.fromJson(Map<String, dynamic> json) => TagActionBody(
      response: json['TagActionResponse'] != null ? TagActionResponse.fromJson(json['TagActionResponse']) : null,
      fault: json['Fault'] != null ? SoapFault.fromJson(json['Fault']) : null);

  TagActionRequest? get tagActionRequest => request as TagActionRequest?;

  TagActionResponse? get tagActionResponse => response as TagActionResponse?;

  @override
  Map<String, dynamic> toJson() => {
        if (request != null) 'TagActionRequest': request!.toJson(),
      };
}
