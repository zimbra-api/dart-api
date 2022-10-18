// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_header.dart';
import 'package:zimbra_api/src/common/type/soap_envelope.dart';
import 'package:zimbra_api/src/common/type/soap_request.dart';

import 'destroy_wait_set_body.dart';
import 'destroy_wait_set_envelope.dart';

/// Use this to close out the waitset.
/// Note that the server will automatically time out a wait set if there is no reference to it for (default of) 20 minutes.
/// WaitSet: scalable mechanism for listening for changes to one or more accounts
class DestroyWaitSetRequest extends SoapRequest {
  /// Waitset ID
  final String waitSetId;

  DestroyWaitSetRequest(this.waitSetId);

  @override
  SoapEnvelope getEnvelope({SoapHeader? header}) =>
      DestroyWaitSetEnvelope(DestroyWaitSetBody(request: this), header: header);

  @override
  Map<String, dynamic> toJson() => {
        '_jsns': 'urn:zimbraMail',
        'waitSet': waitSetId,
      };
}
