// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

class FaultCode {
  final String value;

  FaultCode(this.value);

  factory FaultCode.fromMap(Map<String, dynamic> data) =>
      FaultCode(data['Value'] ?? '');

  Map<String, dynamic> toMap() => {
        'Value': value,
      };
}
