// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/key_value_pair.dart';

abstract class ObjectInfo {
  /// Name
  String name;

  /// Id
  String id;

  /// Attributes
  final List<KeyValuePair> attrList;

  ObjectInfo(this.name, this.id, {this.attrList = const <KeyValuePair>[]});
}
