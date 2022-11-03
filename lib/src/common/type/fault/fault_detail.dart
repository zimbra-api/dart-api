// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

class FaultDetail {
  final Map<String, dynamic> error;

  FaultDetail(this.error);

  factory FaultDetail.fromMap(Map<String, dynamic> data) => FaultDetail(data['Error'] ?? {});

  Map<String, dynamic> toMap() => {
        'Error': error,
      };
}
