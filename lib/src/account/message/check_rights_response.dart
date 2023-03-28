// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import '../../common/type/soap_response.dart';
import '../type/check_rights_target_info.dart';

class CheckRightsResponse extends SoapResponse {
  final List<CheckRightsTargetInfo> targets;

  CheckRightsResponse({this.targets = const []});

  factory CheckRightsResponse.fromMap(
    Map<String, dynamic> data,
  ) =>
      CheckRightsResponse(
        targets: (data['target'] is Iterable)
            ? (data['target'] as Iterable)
                .map<CheckRightsTargetInfo>(
                    (target) => CheckRightsTargetInfo.fromMap(target))
                .toList(growable: false)
            : const [],
      );
}
