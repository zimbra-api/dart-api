// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_header.dart';
import 'package:zimbra_api/src/common/type/soap_envelope.dart';
import 'package:zimbra_api/src/common/type/soap_request.dart';
import 'package:zimbra_api/src/mail/type/tag_action_selector.dart';

import 'tag_action_body.dart';
import 'tag_action_envelope.dart';

/// Perform an action on a tag
class TagActionRequest extends SoapRequest {
  /// Specify action to perform.
  /// Caller must supply one of "id" or "tn"
  /// Supported operations: "read|!read|color|delete|rename|update|retentionpolicy"
  /// If op="update", the caller can specify "name" and/or "color"
  final TagActionSelector action;

  TagActionRequest(this.action);

  @override
  SoapEnvelope getEnvelope({SoapHeader? header}) => TagActionEnvelope(TagActionBody(request: this), header: header);

  @override
  Map<String, dynamic> toJson() => {
        '_jsns': 'urn:zimbraMail',
        'action': action.toJson(),
      };
}
