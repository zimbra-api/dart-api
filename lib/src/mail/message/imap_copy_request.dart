// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import '../../common/enum/mail_item_type.dart';
import '../../common/type/soap_header.dart';
import '../../common/type/soap_envelope.dart';
import '../../common/type/soap_request.dart';
import 'imap_copy_body.dart';
import 'imap_copy_envelope.dart';

/// Return the count of recent items in the specified folder
class IMAPCopyRequest extends SoapRequest {
  /// Comma separated list of int ids
  final String ids;

  /// Mail item type.
  /// Valid values are case insensitive types from MailItemType enum
  final MailItemType type;

  /// Target folder ID
  final int folder;

  IMAPCopyRequest(this.ids, this.type, this.folder);

  @override
  SoapEnvelope getEnvelope({SoapHeader? header}) => IMAPCopyEnvelope(
        IMAPCopyBody(request: this),
        header: header,
      );

  @override
  Map<String, dynamic> toMap() => {
        '_jsns': 'urn:zimbraMail',
        'ids': ids,
        't': type.name,
        'l': folder,
      };
}
