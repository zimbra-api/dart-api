// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import '../../common/type/named_element.dart';
import '../../common/type/soap_response.dart';

class GetAvailableSkinsResponse extends SoapResponse {
  /// Information about skins
  final List<NamedElement> skins;

  GetAvailableSkinsResponse({this.skins = const []});

  factory GetAvailableSkinsResponse.fromMap(
    Map<String, dynamic> data,
  ) =>
      GetAvailableSkinsResponse(
        skins: (data['skin'] is Iterable)
            ? (data['skin'] as Iterable)
                .map<NamedElement>(
                  (skin) => NamedElement.fromMap(skin),
                )
                .toList(growable: false)
            : const [],
      );
}
