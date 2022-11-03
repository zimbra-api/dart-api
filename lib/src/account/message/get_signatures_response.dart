// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/account/type/signature.dart';
import 'package:zimbra_api/src/common/type/soap_response.dart';

class GetSignaturesResponse extends SoapResponse {
  final List<Signature> signatures;

  GetSignaturesResponse({this.signatures = const []});

  factory GetSignaturesResponse.fromMap(Map<String, dynamic> data) => GetSignaturesResponse(
      signatures: (data['signature'] is Iterable)
          ? List.from((data['signature'] as Iterable).map<Signature>((signature) => Signature.fromMap(signature)))
          : []);
}
