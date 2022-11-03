// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_header.dart';
import 'package:zimbra_api/src/common/type/soap_envelope.dart';
import 'package:zimbra_api/src/common/type/soap_request.dart';
import 'package:zimbra_api/src/mail/type/tag_spec.dart';

import 'create_tag_body.dart';
import 'create_tag_envelope.dart';

/// Create a tag
class CreateTagRequest extends SoapRequest {
  /// Tag specification
  final TagSpec tag;

  CreateTagRequest(this.tag);

  @override
  SoapEnvelope getEnvelope({SoapHeader? header}) => CreateTagEnvelope(CreateTagBody(request: this), header: header);

  @override
  Map<String, dynamic> toMap() => {
        '_jsns': 'urn:zimbraMail',
        'tag': tag.toMap(),
      };
}
