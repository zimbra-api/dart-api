// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

class UserAgentInfo {
  final String? name;

  final String? version;

  UserAgentInfo({this.name, this.version});

  factory UserAgentInfo.fromJson(Map<String, dynamic> json) =>
      UserAgentInfo(name: json['name'], version: json['version']);

  Map<String, dynamic> toJson() => {
        if (name != null) 'name': name,
        if (version != null) 'version': version,
      };
}
