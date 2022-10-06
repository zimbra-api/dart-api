// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/account/type/identity.dart';
import 'package:zimbra_api/src/common/type/soap_response.dart';

class CreateIdentityResponse extends SoapResponse {
  /// Information about created identity
  final Identity? identity;

  CreateIdentityResponse({this.identity});

  factory CreateIdentityResponse.fromJson(Map<String, dynamic> json) =>
      CreateIdentityResponse(identity: json['identity'] != null ? Identity.fromJson(json['identity']) : null);
}
