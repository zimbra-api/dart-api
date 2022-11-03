// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_header.dart';
import 'package:zimbra_api/src/common/type/soap_envelope.dart';
import 'package:zimbra_api/src/common/type/soap_request.dart';

import 'get_modified_items_ids_body.dart';
import 'get_modified_items_ids_envelope.dart';

/// Returns the IDs of all items modified since a given change number
class GetModifiedItemsIDsRequest extends SoapRequest {
  /// Root folder ID. If present, we start sync there rather than at folder 11
  final int folderId;

  /// Value passed by IMAP client in CHANGEDSINCE modifier
  final int modSeq;

  GetModifiedItemsIDsRequest(this.folderId, this.modSeq);

  @override
  SoapEnvelope getEnvelope({SoapHeader? header}) =>
      GetModifiedItemsIDsEnvelope(GetModifiedItemsIDsBody(request: this), header: header);

  @override
  Map<String, dynamic> toMap() => {
        '_jsns': 'urn:zimbraMail',
        'l': folderId,
        'ms': modSeq,
      };
}
