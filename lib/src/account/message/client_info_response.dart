// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/attr.dart';
import 'package:zimbra_api/src/common/type/soap_response.dart';

class ClientInfoResponse extends SoapResponse {
  /// Attributes
  final List<Attr> attrs;

  ClientInfoResponse({this.attrs = const []});

  factory ClientInfoResponse.fromMap(Map<String, dynamic> data) => ClientInfoResponse(
      attrs: (data['a'] is Iterable) ? List.from((data['a'] as Iterable).map<Attr>((a) => Attr.fromMap(a))) : []);
}
