// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import '../../common/type/soap_header.dart';
import '../../common/type/soap_envelope.dart';
import '../../common/type/soap_request.dart';
import 'announce_organizer_change_body.dart';
import 'announce_organizer_change_envelope.dart';

/// Announce change of organizer
class AnnounceOrganizerChangeRequest extends SoapRequest {
  /// ID
  final String id;

  AnnounceOrganizerChangeRequest(this.id);

  @override
  SoapEnvelope getEnvelope({
    SoapHeader? header,
  }) =>
      AnnounceOrganizerChangeEnvelope(
        AnnounceOrganizerChangeBody(request: this),
        header: header,
      );

  @override
  Map<String, dynamic> toMap() => {
        '_jsns': 'urn:zimbraMail',
        'id': id,
      };
}
