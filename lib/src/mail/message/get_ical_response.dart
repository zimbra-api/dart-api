// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_response.dart';
import 'package:zimbra_api/src/mail/type/ical_content.dart';

class GetICalResponse extends SoapResponse {
  /// iCalendar content
  final ICalContent? content;

  GetICalResponse({this.content});

  factory GetICalResponse.fromMap(Map<String, dynamic> data) =>
      GetICalResponse(content: (data['ical'] is Map) ? ICalContent.fromMap(data['ical']) : null);
}
