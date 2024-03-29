// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import '../../common/type/soap_response.dart';
import '../type/identity.dart';

class GetIdentitiesResponse extends SoapResponse {
  /// Identities
  final List<Identity> identities;

  GetIdentitiesResponse({this.identities = const []});

  factory GetIdentitiesResponse.fromMap(
    Map<String, dynamic> data,
  ) =>
      GetIdentitiesResponse(
        identities: (data['identity'] is Iterable)
            ? (data['identity'] as Iterable)
                .map<Identity>((identity) => Identity.fromMap(identity))
                .toList(growable: false)
            : const [],
      );
}
