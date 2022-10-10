// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/account/type/locale_info.dart';
import 'package:zimbra_api/src/common/type/soap_response.dart';

class GetAllLocalesResponse extends SoapResponse {
  /// Information about locales
  final List<LocaleInfo> locales;

  GetAllLocalesResponse({this.locales = const []});

  factory GetAllLocalesResponse.fromJson(Map<String, dynamic> json) {
    final locales = <LocaleInfo>[];
    if (json['locale'] != null && json['locale'] is Iterable) {
      final elements = json['locale'] as Iterable;
      for (final locale in elements) {
        locales.add(LocaleInfo.fromJson(locale));
      }
    }

    return GetAllLocalesResponse(locales: locales);
  }
}
