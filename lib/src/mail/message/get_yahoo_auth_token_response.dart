// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import '../../common/type/soap_response.dart';

class GetYahooAuthTokenResponse extends SoapResponse {
  final bool? failed;

  GetYahooAuthTokenResponse({this.failed});

  factory GetYahooAuthTokenResponse.fromMap(Map<String, dynamic> data) =>
      GetYahooAuthTokenResponse(failed: data['failed']);
}
