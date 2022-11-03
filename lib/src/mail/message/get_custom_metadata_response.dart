// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_response.dart';
import 'package:zimbra_api/src/mail/type/mail_custom_metadata.dart';

class GetCustomMetadataResponse extends SoapResponse {
  /// Item ID
  final String? id;

  /// Custom metadata
  final MailCustomMetadata? metadata;

  GetCustomMetadataResponse({this.id, this.metadata});

  factory GetCustomMetadataResponse.fromMap(Map<String, dynamic> data) => GetCustomMetadataResponse(
      id: data['id'], metadata: data['meta'] is Map ? MailCustomMetadata.fromMap(data['meta']) : null);
}
