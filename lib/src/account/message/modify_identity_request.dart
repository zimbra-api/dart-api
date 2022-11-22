// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import '../../common/type/soap_envelope.dart';
import '../../common/type/soap_header.dart';
import '../../common/type/soap_request.dart';
import '../type/identity.dart';
import 'modify_identity_body.dart';
import 'modify_identity_envelope.dart';

/// Modify an identity
class ModifyIdentityRequest extends SoapRequest {
  /// Specify identity to be modified
  /// Must specify either "name" or "id" attribute
  final Identity identity;

  ModifyIdentityRequest(this.identity);

  @override
  SoapEnvelope getEnvelope({SoapHeader? header}) =>
      ModifyIdentityEnvelope(ModifyIdentityBody(request: this), header: header);

  @override
  Map<String, dynamic> toMap() => {
        '_jsns': 'urn:zimbraAccount',
        'identity': identity.toMap(),
      };
}
