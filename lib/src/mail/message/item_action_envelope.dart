// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_envelope.dart';
import 'package:zimbra_api/src/common/type/soap_header.dart';

import 'item_action_body.dart';

class ItemActionEnvelope extends SoapEnvelope {
  ItemActionEnvelope(ItemActionBody body, {super.header}) : super(body);

  factory ItemActionEnvelope.fromJson(Map<String, dynamic> json) =>
      ItemActionEnvelope(ItemActionBody.fromJson(json['Body']),
          header: json['Header'] != null ? SoapHeader.fromJson(json['Header']) : null);

  ItemActionBody get itemActionBody => body as ItemActionBody;
}