// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import '../../common/type/named_element.dart';
import '../../common/type/soap_response.dart';

class GetAvailableCsvFormatsResponse extends SoapResponse {
  /// Information about csvFormats
  final List<NamedElement> csvFormats;

  GetAvailableCsvFormatsResponse({this.csvFormats = const []});

  factory GetAvailableCsvFormatsResponse.fromMap(Map<String, dynamic> data) => GetAvailableCsvFormatsResponse(
      csvFormats: (data['csv'] is Iterable)
          ? (data['csv'] as Iterable).map<NamedElement>((csv) => NamedElement.fromMap(csv)).toList(growable: false)
          : const []);
}
