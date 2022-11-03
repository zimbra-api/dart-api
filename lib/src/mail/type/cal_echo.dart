// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'invite_as_mp.dart';

class CalEcho {
  /// Invite
  final InviteAsMP? invite;

  CalEcho({this.invite});

  factory CalEcho.fromMap(Map<String, dynamic> data) =>
      CalEcho(invite: data['m'] is Map ? InviteAsMP.fromMap(data['m']) : null);

  Map<String, dynamic> toMap() => {
        if (invite != null) 'm': invite!.toMap(),
      };
}
