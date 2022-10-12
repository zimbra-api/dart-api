// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_header.dart';
import 'package:zimbra_api/src/common/type/soap_envelope.dart';
import 'package:zimbra_api/src/common/type/soap_request.dart';
import 'package:zimbra_api/src/mail/type/added_comment.dart';

import 'add_comment_body.dart';
import 'add_comment_envelope.dart';

class AddCommentRequest extends SoapRequest {
  final AddedComment comment;

  AddCommentRequest(this.comment);

  @override
  SoapEnvelope getEnvelope({SoapHeader? header}) => AddCommentEnvelope(AddCommentBody(request: this), header: header);

  @override
  Map<String, dynamic> toJson() => {
        '_jsns': 'urn:zimbraMail',
        'comment': comment.toJson(),
      };
}
