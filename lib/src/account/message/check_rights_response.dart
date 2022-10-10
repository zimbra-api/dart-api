// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/account/type/check_rights_target_info.dart';
import 'package:zimbra_api/src/common/type/soap_response.dart';

class CheckRightsResponse extends SoapResponse {
  final List<CheckRightsTargetInfo> targets;

  CheckRightsResponse({this.targets = const []});

  factory CheckRightsResponse.fromJson(json) {
    final targets = <CheckRightsTargetInfo>[];
    if (json['target'] != null && json['target'] is Iterable) {
      final elements = json['target'] as Iterable;
      for (final target in elements) {
        targets.add(CheckRightsTargetInfo.fromJson(target));
      }
    }
    return CheckRightsResponse(targets: targets);
  }
}
