// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_body.dart';
import 'package:zimbra_api/src/common/type/soap_fault.dart';

import 'ranking_action_request.dart';
import 'ranking_action_response.dart';

class RankingActionBody extends SoapBody {
  RankingActionBody({RankingActionRequest? request, RankingActionResponse? response, super.fault})
      : super(request: request, response: response);

  factory RankingActionBody.fromJson(Map<String, dynamic> json) => RankingActionBody(
      response:
          json['RankingActionResponse'] != null ? RankingActionResponse.fromJson(json['RankingActionResponse']) : null,
      fault: json['Fault'] != null ? SoapFault.fromJson(json['Fault']) : null);

  RankingActionRequest? get purgeRevisionRequest => request as RankingActionRequest?;

  RankingActionResponse? get purgeRevisionResponse => response as RankingActionResponse?;

  @override
  Map<String, dynamic> toJson() => {
        if (request != null) 'RankingActionRequest': request!.toJson(),
      };
}
