// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_envelope.dart';
import 'package:zimbra_api/src/common/type/soap_header.dart';

import 'delete_identity_body.dart';

class DeleteIdentityEnvelope extends SoapEnvelope {
  DeleteIdentityEnvelope(DeleteIdentityBody body, {super.header}) : super(body);

  factory DeleteIdentityEnvelope.fromJson(Map<String, dynamic> json) =>
      DeleteIdentityEnvelope(DeleteIdentityBody.fromJson(json['Body']),
          header: json['Header'] != null ? SoapHeader.fromJson(json['Header']) : null);

  DeleteIdentityBody get deleteIdentityBody => body as DeleteIdentityBody;
}
