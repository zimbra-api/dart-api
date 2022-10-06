// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/account/type/signature.dart';
import 'package:zimbra_api/src/common/type/soap_response.dart';

class CreateSignatureResponse extends SoapResponse {
  /// Information about created signature
  final Signature? signature;

  CreateSignatureResponse({this.signature});

  factory CreateSignatureResponse.fromJson(Map<String, dynamic> json) =>
      CreateSignatureResponse(signature: json['signature'] != null ? Signature.fromJson(json['signature']) : null);
}
