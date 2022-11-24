// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import '../../common/enum/gal_search_type.dart';
import '../../common/type/soap_header.dart';
import '../../common/type/soap_envelope.dart';
import '../../common/type/soap_request.dart';
import 'auto_complete_body.dart';
import 'auto_complete_envelope.dart';

/// Auto complete
class AutoCompleteRequest extends SoapRequest {
  /// Name
  final String name;

  /// Type of addresses to auto-complete on
  final GalSearchType? type;

  /// Set if the "exp" flag is needed in the response for group entries. Default is unset.
  final bool? needCanExpand;

  /// Comma separated list of folder IDs
  final String? folderList;

  /// Flag whether to include Global Address Book (GAL)
  final bool? includeGal;

  AutoCompleteRequest(
    this.name, {
    this.type,
    this.needCanExpand,
    this.folderList,
    this.includeGal,
  });

  @override
  SoapEnvelope getEnvelope({SoapHeader? header}) =>
      AutoCompleteEnvelope(AutoCompleteBody(request: this), header: header);

  @override
  Map<String, dynamic> toMap() => {
        '_jsns': 'urn:zimbraMail',
        'name': name,
        if (type != null) 't': type!.name,
        if (needCanExpand != null) 'needExp': needCanExpand,
        if (folderList != null) 'folders': folderList,
        if (includeGal != null) 'includeGal': includeGal,
      };
}
