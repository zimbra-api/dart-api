// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import '../../common/type/soap_envelope.dart';
import '../../common/type/soap_header.dart';
import '../../common/type/soap_request.dart';
import '../type/account_ace_info.dart';
import 'grant_rights_body.dart';
import 'grant_rights_envelope.dart';

/// Grant account level rights
class GrantRightsRequest extends SoapRequest {
  /// Specify Access Control Entries
  final List<AccountACEInfo> aces;

  GrantRightsRequest({this.aces = const []});

  @override
  SoapEnvelope getEnvelope({SoapHeader? header}) => GrantRightsEnvelope(
        GrantRightsBody(request: this),
        header: header,
      );

  @override
  Map<String, dynamic> toMap() => {
        '_jsns': 'urn:zimbraAccount',
        if (aces.isNotEmpty)
          'ace': aces
              .map(
                (ace) => ace.toMap(),
              )
              .toList(growable: false),
      };
}
