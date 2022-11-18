// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

class UrlAndValue {
  final String? url;

  final String? value;

  const UrlAndValue({this.url, this.value});

  factory UrlAndValue.fromMap(Map<String, dynamic> data) => UrlAndValue(url: data['url'], value: data['_content']);

  Map<String, dynamic> toMap() => {
        if (url != null) 'url': url,
        if (value != null) '_content': value,
      };
}
