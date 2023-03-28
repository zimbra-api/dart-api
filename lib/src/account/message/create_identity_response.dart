// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import '../../common/type/soap_response.dart';
import '../type/identity.dart';

class CreateIdentityResponse extends SoapResponse {
  /// Information about created identity
  final Identity? identity;

  CreateIdentityResponse({this.identity});

  factory CreateIdentityResponse.fromMap(
    Map<String, dynamic> data,
  ) =>
      CreateIdentityResponse(
        identity: data['identity'] is Map
            ? Identity.fromMap(
                data['identity'],
              )
            : null,
      );
}
