// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import '../../common/type/soap_response.dart';
import '../type/discover_rights_info.dart';

class DiscoverRightsResponse extends SoapResponse {
  /// Information about targets for rights
  final List<DiscoverRightsInfo> discoveredRights;

  DiscoverRightsResponse({this.discoveredRights = const []});

  factory DiscoverRightsResponse.fromMap(
    Map<String, dynamic> data,
  ) =>
      DiscoverRightsResponse(
        discoveredRights: (data['targets'] is Iterable)
            ? (data['targets'] as Iterable)
                .map<DiscoverRightsInfo>(
                    (info) => DiscoverRightsInfo.fromMap(info))
                .toList(growable: false)
            : const [],
      );
}
