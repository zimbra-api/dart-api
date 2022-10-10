// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_envelope.dart';
import 'package:zimbra_api/src/common/type/soap_header.dart';
import 'package:zimbra_api/src/common/type/soap_request.dart';

import 'get_white_black_list_body.dart';
import 'get_white_black_list_envelope.dart';

/// Get the anti-spam WhiteList and BlackList addresses
class GetWhiteBlackListRequest extends SoapRequest {
  @override
  SoapEnvelope getEnvelope({SoapHeader? header}) =>
      GetWhiteBlackListEnvelope(GetWhiteBlackListBody(request: this), header: header);

  @override
  Map<String, dynamic> toJson() => {
        '_jsns': 'urn:zimbraAccount',
      };
}
