// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_body.dart';

import 'tag_action_request.dart';
import 'tag_action_response.dart';

class TagActionBody extends SoapBody {
  TagActionBody({TagActionRequest? request, TagActionResponse? response})
      : super(request: request, response: response);

  factory TagActionBody.fromMap(Map<String, dynamic> data) => TagActionBody(
      response: data['TagActionResponse'] != null ? TagActionResponse.fromMap(data['TagActionResponse']) : null);

  @override
  Map<String, dynamic> toMap() => {
        if (request != null) 'TagActionRequest': request!.toMap(),
      };
}
