// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_response.dart';
import 'package:zimbra_api/src/mail/type/browse_data.dart';

class BrowseResponse extends SoapResponse {
  /// Browse data
  final List<BrowseData> browseDatas;

  BrowseResponse({this.browseDatas = const []});

  factory BrowseResponse.fromJson(Map<String, dynamic> json) => BrowseResponse(
      browseDatas: (json['bd'] is Iterable)
          ? List.from((json['bd'] as Iterable).map<BrowseData>((bd) => BrowseData.fromJson(bd)))
          : []);
}
