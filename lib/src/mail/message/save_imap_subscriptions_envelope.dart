// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_envelope.dart';
import 'package:zimbra_api/src/common/type/soap_header.dart';

import 'save_imap_subscriptions_body.dart';

class SaveIMAPSubscriptionsEnvelope extends SoapEnvelope {
  SaveIMAPSubscriptionsEnvelope(SaveIMAPSubscriptionsBody body, {super.header}) : super(body);

  factory SaveIMAPSubscriptionsEnvelope.fromJson(Map<String, dynamic> json) =>
      SaveIMAPSubscriptionsEnvelope(SaveIMAPSubscriptionsBody.fromJson(json['Body']),
          header: json['Header'] != null ? SoapHeader.fromJson(json['Header']) : null);

  SaveIMAPSubscriptionsBody get saveIMAPSubscriptionsBody => body as SaveIMAPSubscriptionsBody;
}