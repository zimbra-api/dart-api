// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/account/type/locale_info.dart';
import 'package:zimbra_api/src/common/type/soap_response.dart';

class GetAvailableLocalesResponse extends SoapResponse {
  /// Information about locales
  final List<LocaleInfo> locales;

  GetAvailableLocalesResponse({this.locales = const <LocaleInfo>[]});

  factory GetAvailableLocalesResponse.fromJson(Map<String, dynamic> json) {
    final response = GetAvailableLocalesResponse();

    if (json['locale'] != null && json['locale'] is Iterable) {
      final locales = json['locale'] as Iterable;
      for (final locale in locales) {
        response.locales.add(LocaleInfo.fromJson(locale));
      }
    }

    return response;
  }
}
