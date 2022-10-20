// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

class Rights {
  ///The effective permissions of the specified folder
  final String effectivePermissions;

  Rights({this.effectivePermissions = ''});

  factory Rights.fromJson(Map<String, dynamic> json) => Rights(effectivePermissions: json['perm'] ?? '');

  Map<String, dynamic> toJson() => {
        'perm': effectivePermissions,
      };
}
