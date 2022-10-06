// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/account/type/identity.dart';
import 'package:zimbra_api/src/common/type/soap_response.dart';

class GetIdentitiesResponse extends SoapResponse {
  /// Identities
  final List<Identity> identities;

  GetIdentitiesResponse({this.identities = const <Identity>[]});

  factory GetIdentitiesResponse.fromJson(Map<String, dynamic> json) {
    final response = GetIdentitiesResponse();

    if (json['identity'] != null && json['identity'] is Iterable) {
      final identities = json['identity'] as Iterable;
      for (final identity in identities) {
        response.identities.add(Identity.fromJson(identity));
      }
    }

    return response;
  }
}
