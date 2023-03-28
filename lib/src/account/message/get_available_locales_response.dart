// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import '../../common/type/soap_response.dart';
import '../type/locale_info.dart';

class GetAvailableLocalesResponse extends SoapResponse {
  /// Information about locales
  final List<LocaleInfo> locales;

  GetAvailableLocalesResponse({this.locales = const []});

  factory GetAvailableLocalesResponse.fromMap(
    Map<String, dynamic> data,
  ) =>
      GetAvailableLocalesResponse(
        locales: (data['locale'] is Iterable)
            ? (data['locale'] as Iterable)
                .map<LocaleInfo>(
                  (locale) => LocaleInfo.fromMap(locale),
                )
                .toList(growable: false)
            : const [],
      );
}
