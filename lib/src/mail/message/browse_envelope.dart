// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_envelope.dart';
import 'package:zimbra_api/src/common/type/soap_header.dart';

import 'browse_body.dart';

class BrowseEnvelope extends SoapEnvelope {
  BrowseEnvelope(BrowseBody body, {super.header}) : super(body);

  factory BrowseEnvelope.fromJson(Map<String, dynamic> json) => BrowseEnvelope(BrowseBody.fromJson(json['Body']),
      header: json['Header'] != null ? SoapHeader.fromJson(json['Header']) : null);

  BrowseBody get browseBody => body as BrowseBody;
}