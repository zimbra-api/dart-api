// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import '../../common/enum/browse_by.dart';
import '../../common/type/soap_header.dart';
import '../../common/type/soap_envelope.dart';
import '../../common/type/soap_request.dart';
import 'browse_body.dart';
import 'browse_envelope.dart';

/// Browse
class BrowseRequest extends SoapRequest {
  /// Browse by setting - domains|attachments|objects
  final BrowseBy browseBy;

  /// Regex string. Return only those results which match the specified regular expression
  final String? regex;

  /// Return only a maximum number of entries as requested
  final int? max;

  BrowseRequest(this.browseBy, {this.regex, this.max});

  @override
  SoapEnvelope getEnvelope({SoapHeader? header}) => BrowseEnvelope(
        BrowseBody(request: this),
        header: header,
      );

  @override
  Map<String, dynamic> toMap() => {
        '_jsns': 'urn:zimbraMail',
        'browseBy': browseBy.name,
        if (regex != null) 'regex': regex,
        if (max != null) 'maxToReturn': max,
      };
}
