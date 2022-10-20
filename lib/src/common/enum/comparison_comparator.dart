// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

enum ComparisonComparator {
  asciiNumeric,
  asciiCasemap,
  octet;

  String get name {
    switch (this) {
      case ComparisonComparator.asciiNumeric:
        return 'i;ascii-numeric';
      case ComparisonComparator.asciiCasemap:
        return 'i;ascii-casemap';
      case ComparisonComparator.octet:
        return 'i;octet';
    }
  }
}
