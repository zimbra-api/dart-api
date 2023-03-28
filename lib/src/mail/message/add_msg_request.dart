// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import '../../common/type/soap_header.dart';
import '../../common/type/soap_envelope.dart';
import '../../common/type/soap_request.dart';
import '../type/add_msg_spec.dart';
import 'add_msg_body.dart';
import 'add_msg_envelope.dart';

/// Add a message
class AddMsgRequest extends SoapRequest {
  /// Specification of the message to add
  final AddMsgSpec msg;

  /// If set, then do outgoing message filtering if the msg is being added to the Sent
  /// folder and has been flagged as sent. Default is unset.
  final bool? filterSent;

  AddMsgRequest(this.msg, {this.filterSent});

  @override
  SoapEnvelope getEnvelope({SoapHeader? header}) => AddMsgEnvelope(
        AddMsgBody(request: this),
        header: header,
      );

  @override
  Map<String, dynamic> toMap() => {
        '_jsns': 'urn:zimbraMail',
        'm': msg.toMap(),
        if (filterSent != null) 'filterSent': filterSent,
      };
}
