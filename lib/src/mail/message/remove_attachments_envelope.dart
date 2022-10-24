// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_envelope.dart';
import 'package:zimbra_api/src/common/type/soap_header.dart';

import 'remove_attachments_body.dart';

class RemoveAttachmentsEnvelope extends SoapEnvelope {
  RemoveAttachmentsEnvelope(RemoveAttachmentsBody body, {super.header}) : super(body);

  factory RemoveAttachmentsEnvelope.fromJson(Map<String, dynamic> json) =>
      RemoveAttachmentsEnvelope(RemoveAttachmentsBody.fromJson(json['Body']),
          header: json['Header'] != null ? SoapHeader.fromJson(json['Header']) : null);

  RemoveAttachmentsBody get removeAttachmentsBody => body as RemoveAttachmentsBody;
}