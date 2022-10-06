// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/named_element.dart';
import 'package:zimbra_api/src/common/type/soap_response.dart';

class GetAvailableSkinsResponse extends SoapResponse {
  /// Information about skins
  final List<NamedElement> csvFormats;

  GetAvailableSkinsResponse({this.csvFormats = const <NamedElement>[]});

  factory GetAvailableSkinsResponse.fromJson(Map<String, dynamic> json) {
    final response = GetAvailableSkinsResponse();

    if (json['skin'] != null && json['skin'] is Iterable) {
      final skins = json['skin'] as Iterable;
      for (final skin in skins) {
        response.csvFormats.add(NamedElement.fromJson(skin));
      }
    }

    return response;
  }
}
