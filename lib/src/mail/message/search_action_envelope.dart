// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_envelope.dart';
import 'package:zimbra_api/src/common/type/soap_header.dart';

import 'search_action_body.dart';

class SearchActionEnvelope extends SoapEnvelope {
  SearchActionEnvelope(SearchActionBody body, {super.header}) : super(body);

  factory SearchActionEnvelope.fromJson(Map<String, dynamic> json) =>
      SearchActionEnvelope(SearchActionBody.fromJson(json['Body']),
          header: json['Header'] != null ? SoapHeader.fromJson(json['Header']) : null);

  SearchActionBody get searchActionBody => body as SearchActionBody;
}
