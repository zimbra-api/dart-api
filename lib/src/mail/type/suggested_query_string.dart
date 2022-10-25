// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

class SuggestedQueryString {
  /// Suggested query string
  final String suggestedQueryString;

  SuggestedQueryString(this.suggestedQueryString);

  factory SuggestedQueryString.fromJson(Map<String, dynamic> json) => SuggestedQueryString(json['_content'] ?? '');

  Map<String, dynamic> toJson() => {
        '_content': suggestedQueryString,
      };
}
