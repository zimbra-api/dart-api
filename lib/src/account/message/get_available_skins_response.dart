// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/named_element.dart';
import 'package:zimbra_api/src/common/type/soap_response.dart';

class GetAvailableSkinsResponse extends SoapResponse {
  /// Information about skins
  final List<NamedElement> skins;

  GetAvailableSkinsResponse({this.skins = const []});

  factory GetAvailableSkinsResponse.fromJson(Map<String, dynamic> json) => GetAvailableSkinsResponse(
      skins: (json['skin'] is Iterable)
          ? List.from((json['skin'] as Iterable).map<NamedElement>((skin) => NamedElement.fromJson(skin)))
          : []);
}
