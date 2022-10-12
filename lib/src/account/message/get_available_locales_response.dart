// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/account/type/locale_info.dart';
import 'package:zimbra_api/src/common/type/soap_response.dart';

class GetAvailableLocalesResponse extends SoapResponse {
  /// Information about locales
  final List<LocaleInfo> locales;

  GetAvailableLocalesResponse({this.locales = const []});

  factory GetAvailableLocalesResponse.fromJson(Map<String, dynamic> json) => GetAvailableLocalesResponse(
      locales: (json['locale'] is Iterable)
          ? List.from((json['locale'] as Iterable).map<LocaleInfo>((locale) => LocaleInfo.fromJson(locale)))
          : []);
}
