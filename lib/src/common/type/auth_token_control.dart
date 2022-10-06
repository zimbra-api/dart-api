// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

class AuthTokenControl {
  final bool? voidOnExpired;

  AuthTokenControl({this.voidOnExpired});

  factory AuthTokenControl.fromJson(Map<String, dynamic> json) =>
      AuthTokenControl(voidOnExpired: json['voidOnExpired']);

  Map<String, dynamic> toJson() => {
        'voidOnExpired': voidOnExpired,
      };
}
