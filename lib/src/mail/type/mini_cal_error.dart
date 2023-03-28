// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

class MiniCalError {
  /// ID for calendar folder that couldn't be accessed
  final String? id;

  /// ServiceException error code - service.PERM_DENIED, mail.NO_SUCH_FOLDER, account.NO_SUCH_ACCOUNT, etc.
  final String? code;

  /// Error message from the exception (but no stack trace)
  final String? errorMessage;

  const MiniCalError({this.id, this.code, this.errorMessage});

  factory MiniCalError.fromMap(Map<String, dynamic> data) => MiniCalError(
        id: data['id'],
        code: data['code'],
        errorMessage: data['_content'],
      );

  Map<String, dynamic> toMap() => {
        if (id != null) 'id': id,
        if (code != null) 'code': code,
        if (errorMessage != null) '_content': errorMessage,
      };
}
