// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_envelope.dart';
import 'package:zimbra_api/src/common/type/soap_header.dart';

import 'search_body.dart';

class SearchEnvelope extends SoapEnvelope {
  SearchEnvelope(SearchBody body, {super.header}) : super(body);

  factory SearchEnvelope.fromJson(Map<String, dynamic> json) => SearchEnvelope(SearchBody.fromJson(json['Body']),
      header: json['Header'] != null ? SoapHeader.fromJson(json['Header']) : null);

  SearchBody get searchBody => body as SearchBody;
}
