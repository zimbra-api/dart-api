// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import '../../common/type/soap_envelope.dart';
import '../../common/type/soap_header.dart';
import '../../common/type/soap_request.dart';
import 'sync_gal_body.dart';
import 'sync_gal_envelope.dart';

/// Synchronize with the Global Address List
class SyncGalRequest extends SoapRequest {
  /// The previous synchronization token if applicable
  final String? token;

  /// GAL sync account ID
  final String? galAccountId;

  /// Flag whether only the ID attributes for matching contacts should be returned.
  final bool? idOnly;

  /// Flag whether count of remaining records should be returned in response or not.
  final bool? getCount;

  /// An int specifying the maximum number of results to return
  final int? limit;

  SyncGalRequest({this.token, this.galAccountId, this.idOnly, this.getCount, this.limit});

  @override
  SoapEnvelope getEnvelope({SoapHeader? header}) => SyncGalEnvelope(SyncGalBody(request: this), header: header);

  @override
  Map<String, dynamic> toMap() => {
        '_jsns': 'urn:zimbraAccount',
        if (token != null) 'token': token,
        if (galAccountId != null) 'galAcctId': galAccountId,
        if (idOnly != null) 'idOnly': idOnly,
        if (getCount != null) 'getCount': getCount,
        if (limit != null) 'limit': limit,
      };
}
