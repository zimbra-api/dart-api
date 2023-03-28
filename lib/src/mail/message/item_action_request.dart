// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import '../../common/type/soap_header.dart';
import '../../common/type/soap_envelope.dart';
import '../../common/type/soap_request.dart';
import '../type/action_selector.dart';
import 'item_action_body.dart';
import 'item_action_envelope.dart';

/// Perform an action on an item
class ItemActionRequest extends SoapRequest {
  /// Specify the action to perform
  final ActionSelector action;

  ItemActionRequest(this.action);

  @override
  SoapEnvelope getEnvelope({SoapHeader? header}) => ItemActionEnvelope(
        ItemActionBody(request: this),
        header: header,
      );

  @override
  Map<String, dynamic> toMap() => {
        '_jsns': 'urn:zimbraMail',
        'action': action.toMap(),
      };
}
