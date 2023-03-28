// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import '../../common/type/soap_header.dart';
import '../../common/type/soap_envelope.dart';
import '../../common/type/soap_request.dart';
import '../type/item_spec.dart';
import 'get_item_body.dart';
import 'get_item_envelope.dart';

/// Get item
/// A successful GetItemResponse will contain a single element appropriate for the type of the requested item
/// if there is no matching item, a fault containing the code mail.NO_SUCH_ITEM is returned
class GetItemRequest extends SoapRequest {
  /// Item specification
  final ItemSpec item;

  GetItemRequest(this.item);

  @override
  SoapEnvelope getEnvelope({SoapHeader? header}) => GetItemEnvelope(
        GetItemBody(request: this),
        header: header,
      );

  @override
  Map<String, dynamic> toMap() => {
        '_jsns': 'urn:zimbraMail',
        'item': item.toMap(),
      };
}
