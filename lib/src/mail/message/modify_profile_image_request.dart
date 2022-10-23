// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_header.dart';
import 'package:zimbra_api/src/common/type/soap_envelope.dart';
import 'package:zimbra_api/src/common/type/soap_request.dart';

import 'modify_profile_image_body.dart';
import 'modify_profile_image_envelope.dart';

/// Modify profile image
class ModifyProfileImageRequest extends SoapRequest {
  /// Upload ID of uploaded image to use
  final String? uploadId;

  /// Base64 encoded image data
  final String? imageB64Data;

  ModifyProfileImageRequest({this.uploadId, this.imageB64Data});

  @override
  SoapEnvelope getEnvelope({SoapHeader? header}) =>
      ModifyProfileImageEnvelope(ModifyProfileImageBody(request: this), header: header);

  @override
  Map<String, dynamic> toJson() => {
        '_jsns': 'urn:zimbraMail',
        if (uploadId != null) 'uid': uploadId,
        if (imageB64Data != null) '_content': imageB64Data,
      };
}
