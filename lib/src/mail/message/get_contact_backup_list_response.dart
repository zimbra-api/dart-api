// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import '../../common/type/soap_response.dart';

class GetContactBackupListResponse extends SoapResponse {
  /// list of available contact backups
  final List<String> backups;

  GetContactBackupListResponse({this.backups = const []});

  factory GetContactBackupListResponse.fromMap(
    Map<String, dynamic> data,
  ) =>
      GetContactBackupListResponse(
        backups: (data['backups']?['backup'] is Iterable)
            ? (data['backups']['backup'] as Iterable)
                .map<String>(
                  (backup) => backup['_content'],
                )
                .toList(growable: false)
            : const [],
      );
}
