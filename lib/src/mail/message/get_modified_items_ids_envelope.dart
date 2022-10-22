// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_envelope.dart';
import 'package:zimbra_api/src/common/type/soap_header.dart';

import 'get_modified_items_ids_body.dart';

class GetModifiedItemsIDsEnvelope extends SoapEnvelope {
  GetModifiedItemsIDsEnvelope(GetModifiedItemsIDsBody body, {super.header}) : super(body);

  factory GetModifiedItemsIDsEnvelope.fromJson(Map<String, dynamic> json) =>
      GetModifiedItemsIDsEnvelope(GetModifiedItemsIDsBody.fromJson(json['Body']),
          header: json['Header'] != null ? SoapHeader.fromJson(json['Header']) : null);

  GetModifiedItemsIDsBody get getModifiedItemsIDsBody => body as GetModifiedItemsIDsBody;
}