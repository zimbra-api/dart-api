// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import '../../common/type/id_and_type.dart';
import '../../common/type/soap_response.dart';
import '../type/account_with_modifications.dart';

class WaitSetResponse extends SoapResponse {
  /// WaitSet ID
  final String waitSetId;

  /// true if canceled
  final bool? canceled;

  /// Sequence number
  final int? seqNo;

  /// Information on signaled accounts.
  /// If folder IDs are included then changes only affect those folders.
  final List<AccountWithModifications> signalledAccounts;

  /// Error information
  final List<IdAndType> errors;

  WaitSetResponse(
      {this.waitSetId = '', this.canceled, this.seqNo, this.signalledAccounts = const [], this.errors = const []});

  factory WaitSetResponse.fromMap(Map<String, dynamic> data) => WaitSetResponse(
      waitSetId: data['waitSet'] ?? '',
      canceled: data['canceled'],
      seqNo: int.tryParse(data['seq']?.toString() ?? ''),
      signalledAccounts: (data['a'] is Iterable)
          ? (data['a'] as Iterable)
              .map<AccountWithModifications>((a) => AccountWithModifications.fromMap(a))
              .toList(growable: false)
          : const [],
      errors: (data['error'] is Iterable)
          ? (data['error'] as Iterable).map<IdAndType>((error) => IdAndType.fromMap(error)).toList(growable: false)
          : const []);
}
