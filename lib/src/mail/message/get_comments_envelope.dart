// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_envelope.dart';
import 'package:zimbra_api/src/common/type/soap_header.dart';

import 'get_comments_body.dart';

class GetCommentsEnvelope extends SoapEnvelope {
  GetCommentsEnvelope(GetCommentsBody body, {super.header}) : super(body);

  factory GetCommentsEnvelope.fromJson(Map<String, dynamic> json) =>
      GetCommentsEnvelope(GetCommentsBody.fromJson(json['Body']),
          header: json['Header'] != null ? SoapHeader.fromJson(json['Header']) : null);

  GetCommentsBody get getCommentsBody => body as GetCommentsBody;
}
