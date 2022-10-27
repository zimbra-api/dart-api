// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_envelope.dart';
import 'package:zimbra_api/src/common/type/soap_header.dart';

import 'search_conv_body.dart';

class SearchConvEnvelope extends SoapEnvelope {
  SearchConvEnvelope(SearchConvBody body, {super.header}) : super(body);

  factory SearchConvEnvelope.fromJson(Map<String, dynamic> json) =>
      SearchConvEnvelope(SearchConvBody.fromJson(json['Body']),
          header: json['Header'] != null ? SoapHeader.fromJson(json['Header']) : null);

  SearchConvBody get searchConvBody => body as SearchConvBody;
}