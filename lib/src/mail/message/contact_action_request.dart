// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import '../../common/type/soap_header.dart';
import '../../common/type/soap_envelope.dart';
import '../../common/type/soap_request.dart';
import '../type/contact_action_selector.dart';
import 'contact_action_body.dart';
import 'contact_action_envelope.dart';

/// Contact Action
class ContactActionRequest extends SoapRequest {
  /// Contact action selector
  final ContactActionSelector action;

  ContactActionRequest(this.action);

  @override
  SoapEnvelope getEnvelope({SoapHeader? header}) => ContactActionEnvelope(
        ContactActionBody(request: this),
        header: header,
      );

  @override
  Map<String, dynamic> toMap() => {
        '_jsns': 'urn:zimbraMail',
        'action': action.toMap(),
      };
}
