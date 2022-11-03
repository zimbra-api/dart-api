// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_body.dart';

import 'get_imap_recent_cutoff_request.dart';
import 'get_imap_recent_cutoff_response.dart';

class GetIMAPRecentCutoffBody extends SoapBody {
  GetIMAPRecentCutoffBody({GetIMAPRecentCutoffRequest? request, GetIMAPRecentCutoffResponse? response})
      : super(request: request, response: response);

  factory GetIMAPRecentCutoffBody.fromMap(Map<String, dynamic> data) => GetIMAPRecentCutoffBody(
      response: data['GetIMAPRecentCutoffResponse'] != null
          ? GetIMAPRecentCutoffResponse.fromMap(data['GetIMAPRecentCutoffResponse'])
          : null);

  @override
  Map<String, dynamic> toMap() => {
        if (request != null) 'GetIMAPRecentCutoffRequest': request!.toMap(),
      };
}
