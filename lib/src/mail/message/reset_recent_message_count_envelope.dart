// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_envelope.dart';
import 'package:zimbra_api/src/common/type/soap_header.dart';

import 'reset_recent_message_count_body.dart';

class ResetRecentMessageCountEnvelope extends SoapEnvelope {
  ResetRecentMessageCountEnvelope(ResetRecentMessageCountBody body, {super.header}) : super(body);

  factory ResetRecentMessageCountEnvelope.fromMap(Map<String, dynamic> data) =>
      ResetRecentMessageCountEnvelope(ResetRecentMessageCountBody.fromMap(data['Body']),
          header: data['Header'] != null ? SoapHeader.fromMap(data['Header']) : null);

  ResetRecentMessageCountBody get resetRecentMessageCountBody => body as ResetRecentMessageCountBody;
}
