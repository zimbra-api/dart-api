// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import '../../common/type/key_value_pair.dart';
import '../../common/type/key_value_pairs.dart';
import '../../common/type/soap_response.dart';

class ClientInfoResponse extends SoapResponse {
  /// Attributes
  final List<KeyValuePair> attrs;

  ClientInfoResponse({this.attrs = const []});

  factory ClientInfoResponse.fromMap(
    Map<String, dynamic> data,
  ) =>
      ClientInfoResponse(attrs: KeyValuePairs.keyValuePairsFromMap(data));
}
