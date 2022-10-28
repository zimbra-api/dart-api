// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_envelope.dart';
import 'package:zimbra_api/src/common/type/soap_header.dart';

import 'tag_action_body.dart';

class TagActionEnvelope extends SoapEnvelope {
  TagActionEnvelope(TagActionBody body, {super.header}) : super(body);

  factory TagActionEnvelope.fromJson(Map<String, dynamic> json) =>
      TagActionEnvelope(TagActionBody.fromJson(json['Body']),
          header: json['Header'] != null ? SoapHeader.fromJson(json['Header']) : null);

  TagActionBody get tagActionBody => body as TagActionBody;
}
