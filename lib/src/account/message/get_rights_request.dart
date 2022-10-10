// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/account/type/right.dart';
import 'package:zimbra_api/src/common/type/soap_envelope.dart';
import 'package:zimbra_api/src/common/type/soap_header.dart';
import 'package:zimbra_api/src/common/type/soap_request.dart';

import 'get_rights_body.dart';
import 'get_rights_envelope.dart';

/// Get account level rights.
/// If no <ace> elements are provided, all ACEs are returned in the response.
/// If <ace> elements are provided, only those ACEs with specified rights are returned in the response.
class GetRightsRequest extends SoapRequest {
  /// Specify Access Control Entries to return
  final List<Right> aces;

  GetRightsRequest({this.aces = const []});

  @override
  SoapEnvelope getEnvelope({SoapHeader? header}) => GetRightsEnvelope(GetRightsBody(request: this), header: header);

  @override
  Map<String, dynamic> toJson() => {
        '_jsns': 'urn:zimbraAccount',
        if (aces.isNotEmpty) 'ace': aces.map((ace) => ace.toJson()).toList(),
      };
}
