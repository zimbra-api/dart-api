// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/enum/share_action.dart';
import 'package:zimbra_api/src/common/type/id.dart';
import 'package:zimbra_api/src/common/type/soap_header.dart';
import 'package:zimbra_api/src/common/type/soap_envelope.dart';
import 'package:zimbra_api/src/common/type/soap_request.dart';
import 'package:zimbra_api/src/mail/type/email_addr_info.dart';

import 'send_share_notification_body.dart';
import 'send_share_notification_envelope.dart';

/// Send share notification
/// The client can list the recipient email addresses for the share, along with the itemId of the item being shared.
class SendShareNotificationRequest extends SoapRequest {
  /// Item ID
  final Id item;

  /// Email addresses
  final List<EmailAddrInfo> emailAddresses;

  /// Set to "revoke" if it is a grant revoke notification. It is set to "expire"
  /// by the system to send notification for a grant expiry.
  final ShareAction? action;

  /// Notes
  final String? notes;

  SendShareNotificationRequest(this.item, {this.emailAddresses = const [], this.action, this.notes});

  @override
  SoapEnvelope getEnvelope({SoapHeader? header}) =>
      SendShareNotificationEnvelope(SendShareNotificationBody(request: this), header: header);

  @override
  Map<String, dynamic> toMap() => {
        '_jsns': 'urn:zimbraMail',
        'item': item.toMap(),
        if (emailAddresses.isNotEmpty) 'e': emailAddresses.map((e) => e.toMap()).toList(growable: false),
        if (action != null) 'action': action!.name,
        if (notes != null) 'notes': {'_content': notes},
      };
}
