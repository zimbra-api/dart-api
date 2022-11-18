// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

class FaultReason {
  final String text;

  const FaultReason(this.text);

  factory FaultReason.fromMap(Map<String, dynamic> data) =>
      FaultReason(data['Text'] ?? '');

  Map<String, dynamic> toMap() => {
        'Text': text,
      };
}
