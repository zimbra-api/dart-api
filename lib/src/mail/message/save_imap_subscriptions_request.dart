// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_header.dart';
import 'package:zimbra_api/src/common/type/soap_envelope.dart';
import 'package:zimbra_api/src/common/type/soap_request.dart';

import 'save_imap_subscriptions_body.dart';
import 'save_imap_subscriptions_envelope.dart';

/// Save a list of folder names subscribed to via IMAP
class SaveIMAPSubscriptionsRequest extends SoapRequest {
  /// List of folder paths subscribed via IMAP
  final List<String> subscriptions;

  SaveIMAPSubscriptionsRequest(this.subscriptions);

  @override
  SoapEnvelope getEnvelope({SoapHeader? header}) =>
      SaveIMAPSubscriptionsEnvelope(SaveIMAPSubscriptionsBody(request: this), header: header);

  @override
  Map<String, dynamic> toJson() => {
        '_jsns': 'urn:zimbraMail',
        if (subscriptions.isNotEmpty) 'sub': subscriptions.map((sub) => {'_content': sub}),
      };
}
