// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_body.dart';

import 'reset_recent_message_count_request.dart';
import 'reset_recent_message_count_response.dart';

class ResetRecentMessageCountBody extends SoapBody {
  ResetRecentMessageCountBody(
      {ResetRecentMessageCountRequest? request, ResetRecentMessageCountResponse? response})
      : super(request: request, response: response);

  factory ResetRecentMessageCountBody.fromMap(Map<String, dynamic> data) => ResetRecentMessageCountBody(
      response: data['ResetRecentMessageCountResponse'] != null
          ? ResetRecentMessageCountResponse.fromMap(data['ResetRecentMessageCountResponse'])
          : null);

  @override
  Map<String, dynamic> toMap() => {
        if (request != null) 'ResetRecentMessageCountRequest': request!.toMap(),
      };
}
