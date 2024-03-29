// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'filter_action.dart';

class RedirectAction extends FilterAction {
  /// Email address
  final String? address;

  /// If true, item will be copied to the new location, leaving the original in place.
  /// See https://tools.ietf.org/html/rfc3894 "Sieve Extension: Copying Without Side Effects"
  final bool? copy;

  const RedirectAction({this.address, this.copy, super.index});

  factory RedirectAction.fromMap(Map<String, dynamic> data) => RedirectAction(
        address: data['a'],
        copy: data['copy'],
        index: int.tryParse(data['index']?.toString() ?? ''),
      );

  @override
  Map<String, dynamic> toMap() => {
        if (address != null) 'a': address,
        if (copy != null) 'copy': copy,
        if (index != null) 'index': index,
      };
}
