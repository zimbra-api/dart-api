// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import '../../common/type/soap_response.dart';
import '../type/mail_custom_metadata.dart';

class GetMailboxMetadataResponse extends SoapResponse {
  /// Metadata information
  final MailCustomMetadata? metadata;

  GetMailboxMetadataResponse({this.metadata});

  factory GetMailboxMetadataResponse.fromMap(
    Map<String, dynamic> data,
  ) =>
      GetMailboxMetadataResponse(
        metadata: data['meta'] is Map
            ? MailCustomMetadata.fromMap(
                data['meta'],
              )
            : null,
      );
}
