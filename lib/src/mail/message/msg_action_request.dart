// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import '../../common/type/soap_header.dart';
import '../../common/type/soap_envelope.dart';
import '../../common/type/soap_request.dart';
import '../type/action_selector.dart';
import 'msg_action_body.dart';
import 'msg_action_envelope.dart';

/// Perform an action on a message
/// For op="update", caller can specify any or all of:
/// l="{folder}", name="{name}", color="{color}", tn="{tag-names}", f="{flags}".
/// For op="!spam", can optionally specify a destination folder
class MsgActionRequest extends SoapRequest {
  /// Specify the action to perform
  final ActionSelector action;

  MsgActionRequest(this.action);

  @override
  SoapEnvelope getEnvelope({SoapHeader? header}) => MsgActionEnvelope(MsgActionBody(request: this), header: header);

  @override
  Map<String, dynamic> toMap() => {
        '_jsns': 'urn:zimbraMail',
        'action': action.toMap(),
      };
}
