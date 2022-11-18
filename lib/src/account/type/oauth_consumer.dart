// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

class OAuthConsumer {
  final String? accessToken;

  final String? approvedOn;

  final String? applicationName;

  final String? device;

  const OAuthConsumer({this.accessToken, this.approvedOn, this.applicationName, this.device});

  factory OAuthConsumer.fromMap(Map<String, dynamic> data) => OAuthConsumer(
      accessToken: data['accessToken'],
      approvedOn: data['approvedOn'],
      applicationName: data['appName'],
      device: data['device']);

  Map<String, dynamic> toMap() => {
        if (accessToken != null) 'accessToken': accessToken,
        if (approvedOn != null) 'approvedOn': approvedOn,
        if (applicationName != null) 'appName': applicationName,
        if (device != null) 'device': device,
      };
}
