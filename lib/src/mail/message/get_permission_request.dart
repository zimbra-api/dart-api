// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_header.dart';
import 'package:zimbra_api/src/common/type/soap_envelope.dart';
import 'package:zimbra_api/src/common/type/soap_request.dart';
import 'package:zimbra_api/src/mail/type/right.dart';

import 'get_permission_body.dart';
import 'get_permission_envelope.dart';

/// Get account level permissions
/// If no <ace> elements are provided, all ACEs are returned in the response.
/// If <ace> elements are provided, only those ACEs with specified rights are returned in the response.
/// Note: to be deprecated in Zimbra 9.  Use zimbraAccount GetRights instead.
class GetPermissionRequest extends SoapRequest {
  /// Specification of rights
  final List<Right> aces;

  GetPermissionRequest({this.aces = const []});

  @override
  SoapEnvelope getEnvelope({SoapHeader? header}) =>
      GetPermissionEnvelope(GetPermissionBody(request: this), header: header);

  @override
  Map<String, dynamic> toMap() => {
        '_jsns': 'urn:zimbraMail',
        if (aces.isNotEmpty) 'ace': aces.map((ace) => ace.toMap()).toList(),
      };
}
