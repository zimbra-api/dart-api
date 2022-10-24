// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_envelope.dart';
import 'package:zimbra_api/src/common/type/soap_header.dart';

import 'recover_account_body.dart';

class RecoverAccountEnvelope extends SoapEnvelope {
  RecoverAccountEnvelope(RecoverAccountBody body, {super.header}) : super(body);

  factory RecoverAccountEnvelope.fromJson(Map<String, dynamic> json) =>
      RecoverAccountEnvelope(RecoverAccountBody.fromJson(json['Body']),
          header: json['Header'] != null ? SoapHeader.fromJson(json['Header']) : null);

  RecoverAccountBody get recoverAccountBody => body as RecoverAccountBody;
}
