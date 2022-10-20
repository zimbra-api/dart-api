// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_header.dart';
import 'package:zimbra_api/src/common/type/soap_envelope.dart';
import 'package:zimbra_api/src/common/type/soap_request.dart';
import 'package:zimbra_api/src/mail/type/conversation_spec.dart';

import 'get_conv_body.dart';
import 'get_conv_envelope.dart';

/// Get conversation
///
/// GetConvRequest gets information about the 1 conversation named by id's value.
/// It will return exactly 1 conversation element.
///
/// If fetch="1|all" is included, the full expanded message structure is inlined for the first (or for all) messages
/// in the conversation.  If fetch="{item-id}", only the message with the given {item-id} is expanded inline.
///
/// if headers are requested, any matching headers are inlined into the response (not available when raw="1")
class GetConvRequest extends SoapRequest {
  /// Conversation specification
  final ConversationSpec conversation;

  GetConvRequest(this.conversation);

  @override
  SoapEnvelope getEnvelope({SoapHeader? header}) => GetConvEnvelope(GetConvBody(request: this), header: header);

  @override
  Map<String, dynamic> toJson() => {
        '_jsns': 'urn:zimbraMail',
        'c': conversation.toJson(),
      };
}
