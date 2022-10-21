// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_response.dart';
import 'package:zimbra_api/src/mail/type/mini_cal_error.dart';

class GetMiniCalResponse extends SoapResponse {
  /// Matching busy dates in format : yyyymmdd
  final List<String> busyDates;

  /// Error for each calendar folder that couldn't be accessed
  final List<MiniCalError> errors;

  GetMiniCalResponse({this.busyDates = const [], this.errors = const []});

  factory GetMiniCalResponse.fromJson(Map<String, dynamic> json) => GetMiniCalResponse(
      busyDates: (json['date'] is Iterable)
          ? List.from((json['date'] as Iterable).map<String>((date) => date['_content']))
          : [],
      errors: (json['error'] is Iterable)
          ? List.from((json['error'] as Iterable).map<MiniCalError>((error) => MiniCalError.fromJson(error)))
          : []);
}
