// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import '../../common/type/soap_response.dart';
import '../type/browse_data.dart';

class BrowseResponse extends SoapResponse {
  /// Browse data
  final List<BrowseData> browseDatas;

  BrowseResponse({this.browseDatas = const []});

  factory BrowseResponse.fromMap(Map<String, dynamic> data) => BrowseResponse(
        browseDatas: (data['bd'] is Iterable)
            ? (data['bd'] as Iterable)
                .map<BrowseData>(
                  (bd) => BrowseData.fromMap(bd),
                )
                .toList(growable: false)
            : const [],
      );
}
