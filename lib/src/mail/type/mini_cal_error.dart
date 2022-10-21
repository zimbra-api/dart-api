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

  MiniCalError({this.id, this.code, this.errorMessage});

  factory MiniCalError.fromJson(Map<String, dynamic> json) =>
      MiniCalError(id: json['id'], code: json['code'], errorMessage: json['_content']);

  Map<String, dynamic> toJson() => {
        if (id != null) 'id': id,
        if (code != null) 'code': code,
        if (errorMessage != null) '_content': errorMessage,
      };
}
