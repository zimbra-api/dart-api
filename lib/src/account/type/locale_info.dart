// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

class LocaleInfo {
  /// Locale ID
  String id;

  /// Name of the locale in the locale itself
  String name;

  /// Name of the locale in the users' locale
  String? localName;

  LocaleInfo(this.id, this.name, {this.localName});

  factory LocaleInfo.fromJson(Map<String, dynamic> json) =>
      LocaleInfo(json['id'], json['name'], localName: json['localName']);

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        if (localName != null) 'localName': localName,
      };
}
