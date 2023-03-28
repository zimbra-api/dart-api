// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import '../../common/enum/restore_resolve.dart';
import '../../common/type/soap_header.dart';
import '../../common/type/soap_envelope.dart';
import '../../common/type/soap_request.dart';
import 'restore_contacts_body.dart';
import 'restore_contacts_envelope.dart';

class RestoreContactsRequest extends SoapRequest {
  /// Filename of contact backup file
  final String contactsBackupFileName;

  /// Restore resolve action - one of ignore|modify|replace|reset
  /// Default value - reset
  /// ignore - In case of conflict, ignore the existing contact. Create new contact from backup file.
  /// modify - In case of conflict, merge the existing contact with contact in backup file.
  /// replace - In case of conflict, replace the existing contact with contact in backup file.
  /// reset - Delete all existing contacts and restore contacts from backup file.
  final RestoreResolve? resolve;

  RestoreContactsRequest(this.contactsBackupFileName, {this.resolve});

  @override
  SoapEnvelope getEnvelope({SoapHeader? header}) => RestoreContactsEnvelope(
        RestoreContactsBody(request: this),
        header: header,
      );

  @override
  Map<String, dynamic> toMap() => {
        '_jsns': 'urn:zimbraMail',
        'contactsBackupFileName': contactsBackupFileName,
        if (resolve != null) 'resolve': resolve!.name,
      };
}
