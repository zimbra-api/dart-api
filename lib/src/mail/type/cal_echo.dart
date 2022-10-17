// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'invite_as_mp.dart';

class CalEcho {
  /// Invite
  final InviteAsMP? invite;

  CalEcho({this.invite});

  factory CalEcho.fromJson(Map<String, dynamic> json) =>
      CalEcho(invite: json['m'] is Map ? InviteAsMP.fromJson(json['m']) : null);

  Map<String, dynamic> toJson() => {
        if (invite != null) 'm': invite!.toJson(),
      };
}
