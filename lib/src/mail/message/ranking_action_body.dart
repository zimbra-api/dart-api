// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_body.dart';

import 'ranking_action_request.dart';
import 'ranking_action_response.dart';

class RankingActionBody extends SoapBody {
  RankingActionBody({RankingActionRequest? request, RankingActionResponse? response})
      : super(request: request, response: response);

  factory RankingActionBody.fromMap(Map<String, dynamic> data) => RankingActionBody(
      response:
          data['RankingActionResponse'] != null ? RankingActionResponse.fromMap(data['RankingActionResponse']) : null);

  @override
  Map<String, dynamic> toMap() => {
        if (request != null) 'RankingActionRequest': request!.toMap(),
      };
}
