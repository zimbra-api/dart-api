// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_envelope.dart';
import 'package:zimbra_api/src/common/type/soap_header.dart';

import 'get_item_body.dart';

class GetItemEnvelope extends SoapEnvelope {
  GetItemEnvelope(GetItemBody body, {super.header}) : super(body);

  factory GetItemEnvelope.fromJson(Map<String, dynamic> json) => GetItemEnvelope(GetItemBody.fromJson(json['Body']),
      header: json['Header'] != null ? SoapHeader.fromJson(json['Header']) : null);

  GetItemBody get getItemBody => body as GetItemBody;
}
