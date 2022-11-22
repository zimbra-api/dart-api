// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import '../../common/type/soap_header.dart';
import '../../common/type/soap_envelope.dart';
import '../../common/type/soap_request.dart';
import '../type/parent_id.dart';
import 'get_comments_body.dart';
import 'get_comments_envelope.dart';

/// Get comments
class GetCommentsRequest extends SoapRequest {
  /// Select parent for comments
  final ParentId comment;

  GetCommentsRequest(this.comment);

  @override
  SoapEnvelope getEnvelope({SoapHeader? header}) => GetCommentsEnvelope(GetCommentsBody(request: this), header: header);

  @override
  Map<String, dynamic> toMap() => {
        '_jsns': 'urn:zimbraMail',
        'comment': comment.toMap(),
      };
}
