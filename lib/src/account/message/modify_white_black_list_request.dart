// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/op_value.dart';
import 'package:zimbra_api/src/common/type/soap_envelope.dart';
import 'package:zimbra_api/src/common/type/soap_header.dart';
import 'package:zimbra_api/src/common/type/soap_request.dart';

import 'modify_white_black_list_body.dart';
import 'modify_white_black_list_envelope.dart';

/// Modify the anti-spam WhiteList and BlackList addresses
class ModifyWhiteBlackListRequest extends SoapRequest {
  /// Modifications for WhiteList
  final List<OpValue> whiteListEntries;

  /// Modifications for BlackList
  final List<OpValue> blackListEntries;

  ModifyWhiteBlackListRequest({this.whiteListEntries = const [], this.blackListEntries = const []});

  @override
  SoapEnvelope getEnvelope({SoapHeader? header}) =>
      ModifyWhiteBlackListEnvelope(ModifyWhiteBlackListBody(request: this), header: header);

  @override
  Map<String, dynamic> toMap() => {
        '_jsns': 'urn:zimbraAccount',
        if (whiteListEntries.isNotEmpty)
          'whiteList': {'addr': whiteListEntries.map((entry) => entry.toMap()).toList()},
        if (blackListEntries.isNotEmpty)
          'blackList': {'addr': blackListEntries.map((entry) => entry.toMap()).toList()},
      };
}
