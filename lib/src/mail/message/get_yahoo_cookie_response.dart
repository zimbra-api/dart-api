// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import '../../common/type/soap_response.dart';

class GetYahooCookieResponse extends SoapResponse {
  final String? error;

  final String? crumb;

  final String? y;

  final String? t;

  GetYahooCookieResponse({this.error, this.crumb, this.y, this.t});

  factory GetYahooCookieResponse.fromMap(Map<String, dynamic> data) =>
      GetYahooCookieResponse(error: data['error'], crumb: data['crumb'], y: data['y'], t: data['t']);
}
