// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

enum ConnectionType {
  clearText,
  ssl,
  tls,
  tlsIfAvailable;

  String get name {
    switch (this) {
      case ConnectionType.clearText:
        return 'cleartext';
      case ConnectionType.ssl:
        return 'ssl';
      case ConnectionType.tls:
        return 'tls';
      case ConnectionType.tlsIfAvailable:
        return 'tls_if_available';
    }
  }
}
