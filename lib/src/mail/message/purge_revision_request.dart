// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import '../../common/type/soap_header.dart';
import '../../common/type/soap_envelope.dart';
import '../../common/type/soap_request.dart';
import '../type/purge_revision_spec.dart';
import 'purge_revision_body.dart';
import 'purge_revision_envelope.dart';

/// Purge revision
class PurgeRevisionRequest extends SoapRequest {
  /// Specification of revision to purge
  final PurgeRevisionSpec revision;

  PurgeRevisionRequest(this.revision);

  @override
  SoapEnvelope getEnvelope({SoapHeader? header}) =>
      PurgeRevisionEnvelope(PurgeRevisionBody(request: this), header: header);

  @override
  Map<String, dynamic> toMap() => {
        '_jsns': 'urn:zimbraMail',
        'revision': revision.toMap(),
      };
}
