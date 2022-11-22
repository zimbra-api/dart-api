// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import '../../common/type/soap_header.dart';
import '../../common/type/soap_envelope.dart';
import '../../common/type/soap_request.dart';
import '../type/bulk_action.dart';
import 'search_action_body.dart';
import 'search_action_envelope.dart';
import 'search_request.dart';

class SearchActionRequest extends SoapRequest {
  /// Search request
  final SearchRequest searchRequest;

  /// Bulk action
  final BulkAction bulkAction;

  SearchActionRequest(this.searchRequest, this.bulkAction);

  @override
  SoapEnvelope getEnvelope({SoapHeader? header}) =>
      SearchActionEnvelope(SearchActionBody(request: this), header: header);

  @override
  Map<String, dynamic> toMap() => {
        '_jsns': 'urn:zimbraMail',
        'SearchRequest': searchRequest.toMap(),
        'BulkAction': bulkAction.toMap(),
      };
}
