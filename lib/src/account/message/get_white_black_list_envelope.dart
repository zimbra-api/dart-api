// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_envelope.dart';
import 'package:zimbra_api/src/common/type/soap_header.dart';

import 'get_white_black_list_body.dart';

class GetWhiteBlackListEnvelope extends SoapEnvelope {
  GetWhiteBlackListEnvelope(GetWhiteBlackListBody body, {SoapHeader? header}) : super(body, header: header);

  factory GetWhiteBlackListEnvelope.fromJson(Map<String, dynamic> json) =>
      GetWhiteBlackListEnvelope(GetWhiteBlackListBody.fromJson(json['Body']),
          header: json['Header'] != null ? SoapHeader.fromJson(json['Header']) : null);

  GetWhiteBlackListBody get getWhiteBlackListBody => body as GetWhiteBlackListBody;
}
