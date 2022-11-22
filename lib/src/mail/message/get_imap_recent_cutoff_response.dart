// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import '../../common/type/soap_response.dart';

class GetIMAPRecentCutoffResponse extends SoapResponse {
  /// The last recorded assigned item ID in the enclosing
  /// Mailbox the last time the folder was accessed via a read/write IMAP session.
  /// Note that this value is only updated on session closes
  final int cutoff;

  GetIMAPRecentCutoffResponse(this.cutoff);

  factory GetIMAPRecentCutoffResponse.fromMap(Map<String, dynamic> data) =>
      GetIMAPRecentCutoffResponse(int.tryParse(data['cutoff']?.toString() ?? '') ?? 0);
}
