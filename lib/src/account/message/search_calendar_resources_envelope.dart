// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_envelope.dart';
import 'package:zimbra_api/src/common/type/soap_header.dart';

import 'search_calendar_resources_body.dart';

class SearchCalendarResourcesEnvelope extends SoapEnvelope {
  SearchCalendarResourcesEnvelope(SearchCalendarResourcesBody body, {super.header}) : super(body);

  factory SearchCalendarResourcesEnvelope.fromJson(Map<String, dynamic> json) =>
      SearchCalendarResourcesEnvelope(SearchCalendarResourcesBody.fromJson(json['Body']),
          header: json['Header'] != null ? SoapHeader.fromJson(json['Header']) : null);

  SearchCalendarResourcesBody get searchCalendarResourcesBody => body as SearchCalendarResourcesBody;
}
