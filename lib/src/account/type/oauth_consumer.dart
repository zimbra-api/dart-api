// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

class OAuthConsumer {
  final String? accessToken;

  final String? approvedOn;

  final String? applicationName;

  final String? device;

  OAuthConsumer({this.accessToken, this.approvedOn, this.applicationName, this.device});

  factory OAuthConsumer.fromJson(Map<String, dynamic> json) => OAuthConsumer(
      accessToken: json['accessToken'],
      approvedOn: json['approvedOn'],
      applicationName: json['appName'],
      device: json['device']);

  Map<String, dynamic> toJson() => {
        if (accessToken != null) 'accessToken': accessToken,
        if (approvedOn != null) 'approvedOn': approvedOn,
        if (applicationName != null) 'appName': applicationName,
        if (device != null) 'device': device,
      };
}
