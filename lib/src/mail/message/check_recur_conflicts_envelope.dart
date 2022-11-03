// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_envelope.dart';
import 'package:zimbra_api/src/common/type/soap_header.dart';

import 'check_recur_conflicts_body.dart';

class CheckRecurConflictsEnvelope extends SoapEnvelope {
  CheckRecurConflictsEnvelope(CheckRecurConflictsBody body, {super.header}) : super(body);

  factory CheckRecurConflictsEnvelope.fromMap(Map<String, dynamic> data) =>
      CheckRecurConflictsEnvelope(CheckRecurConflictsBody.fromMap(data['Body']),
          header: data['Header'] != null ? SoapHeader.fromMap(data['Header']) : null);

  CheckRecurConflictsBody get checkRecurConflictsBody => body as CheckRecurConflictsBody;
}
