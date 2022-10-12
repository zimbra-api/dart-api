// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/named_element.dart';
import 'package:zimbra_api/src/common/type/soap_response.dart';

class GetAvailableCsvFormatsResponse extends SoapResponse {
  /// Information about csvFormats
  final List<NamedElement> csvFormats;

  GetAvailableCsvFormatsResponse({this.csvFormats = const []});

  factory GetAvailableCsvFormatsResponse.fromJson(Map<String, dynamic> json) => GetAvailableCsvFormatsResponse(
      csvFormats: (json['csv'] is Iterable)
          ? List.from((json['csv'] as Iterable).map<NamedElement>((csv) => NamedElement.fromJson(csv)))
          : []);
}
