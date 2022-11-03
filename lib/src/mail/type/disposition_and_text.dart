// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

class DispositionAndText {
  /// Disposition.
  /// Sections of text that are identical to both versions are indicated with disp="common".
  /// For each conflict the chunk will show disp="first" or disp="second"
  final String? disposition;

  /// Text
  final String? text;

  DispositionAndText({this.disposition, this.text});

  factory DispositionAndText.fromMap(Map<String, dynamic> data) =>
      DispositionAndText(disposition: data['disp'], text: data['_content']);

  Map<String, dynamic> toMap() => {
        if (disposition != null) 'disp': disposition,
        if (text != null) '_content': text,
      };
}
