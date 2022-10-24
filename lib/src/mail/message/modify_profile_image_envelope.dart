// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_envelope.dart';
import 'package:zimbra_api/src/common/type/soap_header.dart';

import 'modify_profile_image_body.dart';

class ModifyProfileImageEnvelope extends SoapEnvelope {
  ModifyProfileImageEnvelope(ModifyProfileImageBody body, {super.header}) : super(body);

  factory ModifyProfileImageEnvelope.fromJson(Map<String, dynamic> json) =>
      ModifyProfileImageEnvelope(ModifyProfileImageBody.fromJson(json['Body']),
          header: json['Header'] != null ? SoapHeader.fromJson(json['Header']) : null);

  ModifyProfileImageBody get modifyProfileImageBody => body as ModifyProfileImageBody;
}