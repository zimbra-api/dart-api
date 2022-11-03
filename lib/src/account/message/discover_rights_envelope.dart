// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_envelope.dart';
import 'package:zimbra_api/src/common/type/soap_header.dart';

import 'discover_rights_body.dart';

class DiscoverRightsEnvelope extends SoapEnvelope {
  DiscoverRightsEnvelope(DiscoverRightsBody body, {super.header}) : super(body);

  factory DiscoverRightsEnvelope.fromMap(Map<String, dynamic> data) =>
      DiscoverRightsEnvelope(DiscoverRightsBody.fromMap(data['Body']),
          header: data['Header'] != null ? SoapHeader.fromMap(data['Header']) : null);

  DiscoverRightsBody get discoverRightsBody => body as DiscoverRightsBody;
}
