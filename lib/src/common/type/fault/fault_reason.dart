// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

class FaultReason {
  final String text;

  FaultReason(this.text);

  factory FaultReason.fromJson(Map<String, dynamic> json) {
    String text = '';
    if (json['Text'] != null && json['Text'] is Iterable) {
      text = json['Text']['_content'] ?? '';
    }
    return FaultReason(text);
  }

  Map<String, dynamic> toJson() => {
        'Text': {'_content': text},
      };
}
