// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_envelope.dart';
import 'package:zimbra_api/src/common/type/soap_header.dart';

import 'add_comment_body.dart';

class AddCommentEnvelope extends SoapEnvelope {
  AddCommentEnvelope(AddCommentBody body, {super.header}) : super(body);

  factory AddCommentEnvelope.fromJson(Map<String, dynamic> json) =>
      AddCommentEnvelope(AddCommentBody.fromJson(json['Body']),
          header: json['Header'] != null ? SoapHeader.fromJson(json['Header']) : null);

  AddCommentBody get addCommentBody => body as AddCommentBody;
}
