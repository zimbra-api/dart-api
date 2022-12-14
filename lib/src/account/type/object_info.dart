// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import '../../common/type/key_value_pair.dart';

abstract class ObjectInfo {
  /// Name
  final String name;

  /// Id
  final String id;

  /// Attributes
  final List<KeyValuePair> attrList;

  const ObjectInfo(this.name, this.id, {this.attrList = const []});
}
