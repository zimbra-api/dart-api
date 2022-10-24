// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_header.dart';
import 'package:zimbra_api/src/common/type/soap_envelope.dart';
import 'package:zimbra_api/src/common/type/soap_request.dart';
import 'package:zimbra_api/src/mail/type/note_action_selector.dart';

import 'note_action_body.dart';
import 'note_action_envelope.dart';

/// Perform an action on an note
class NoteActionRequest extends SoapRequest {
  /// Specify the action to perform
  final NoteActionSelector action;

  NoteActionRequest(this.action);

  @override
  SoapEnvelope getEnvelope({SoapHeader? header}) => NoteActionEnvelope(NoteActionBody(request: this), header: header);

  @override
  Map<String, dynamic> toJson() => {
        '_jsns': 'urn:zimbraMail',
        'action': action.toJson(),
      };
}
