// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import '../../common/type/soap_envelope.dart';
import '../../common/type/soap_header.dart';
import 'restore_contacts_body.dart';

class RestoreContactsEnvelope extends SoapEnvelope {
  RestoreContactsEnvelope(RestoreContactsBody body, {super.header}) : super(body..response?.header = header);

  factory RestoreContactsEnvelope.fromMap(Map<String, dynamic> data) =>
      RestoreContactsEnvelope(RestoreContactsBody.fromMap(data['Body']),
          header: data['Header'] != null ? SoapHeader.fromMap(data['Header']) : null);
}
