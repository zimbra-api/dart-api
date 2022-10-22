// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

class UrlAndValue {
  final String? url;

  final String? value;

  UrlAndValue({this.url, this.value});

  factory UrlAndValue.fromJson(Map<String, dynamic> json) => UrlAndValue(url: json['url'], value: json['_content']);

  Map<String, dynamic> toJson() => {
        if (url != null) 'url': url,
        if (value != null) '_content': value,
      };
}
