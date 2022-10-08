// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/account/type/discover_rights_info.dart';
import 'package:zimbra_api/src/common/type/soap_response.dart';

class DiscoverRightsResponse extends SoapResponse {
  /// Information about targets for rights
  final List<DiscoverRightsInfo> discoveredRights;

  DiscoverRightsResponse({this.discoveredRights = const <DiscoverRightsInfo>[]});

  factory DiscoverRightsResponse.fromJson(Map<String, dynamic> json) {
    final discoveredRights = <DiscoverRightsInfo>[];
    if (json['targets'] != null && json['targets'] is Iterable) {
      final targets = json['targets'] as Iterable;
      for (final info in targets) {
        discoveredRights.add(DiscoverRightsInfo.fromJson(info));
      }
    }

    return DiscoverRightsResponse(discoveredRights: discoveredRights);
  }
}
