// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

class LocaleInfo {
  /// Locale ID
  final String id;

  /// Name of the locale in the locale itself
  final String name;

  /// Name of the locale in the users' locale
  final String? localName;

  const LocaleInfo(this.id, this.name, {this.localName});

  factory LocaleInfo.fromMap(Map<String, dynamic> data) =>
      LocaleInfo(data['id'], data['name'], localName: data['localName']);

  Map<String, dynamic> toMap() => {
        'id': id,
        'name': name,
        if (localName != null) 'localName': localName,
      };
}
