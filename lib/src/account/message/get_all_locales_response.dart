// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/account/type/locale_info.dart';
import 'package:zimbra_api/src/common/type/soap_response.dart';

class GetAllLocalesResponse extends SoapResponse {
  /// Information about locales
  final List<LocaleInfo> locales;

  GetAllLocalesResponse({this.locales = const []});

  factory GetAllLocalesResponse.fromMap(Map<String, dynamic> data) => GetAllLocalesResponse(
      locales: (data['locale'] is Iterable)
          ? List.from((data['locale'] as Iterable).map<LocaleInfo>((locale) => LocaleInfo.fromMap(locale)))
          : []);
}
