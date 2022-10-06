// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_envelope.dart';
import 'package:zimbra_api/src/common/type/soap_header.dart';

import 'modify_white_black_list_body.dart';

class ModifyWhiteBlackListEnvelope extends SoapEnvelope {
  ModifyWhiteBlackListEnvelope(ModifyWhiteBlackListBody body, {SoapHeader? header}) : super(body, header: header);

  factory ModifyWhiteBlackListEnvelope.fromJson(Map<String, dynamic> json) =>
      ModifyWhiteBlackListEnvelope(ModifyWhiteBlackListBody.fromJson(json['Body']),
          header: json['Header'] != null ? SoapHeader.fromJson(json['Header']) : null);

  ModifyWhiteBlackListBody get modifyWhiteBlackListBody => body as ModifyWhiteBlackListBody;
}
