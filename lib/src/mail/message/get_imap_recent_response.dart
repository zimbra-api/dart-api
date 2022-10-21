// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_response.dart';

class GetIMAPRecentResponse extends SoapResponse {
  /// Number of recent items
  final int num;

  GetIMAPRecentResponse(this.num);

  factory GetIMAPRecentResponse.fromJson(Map<String, dynamic> json) => GetIMAPRecentResponse(json['n'] ?? 0);
}
