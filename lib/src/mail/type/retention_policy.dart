// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'policy.dart';

class RetentionPolicy {
  /// 'Keep' retention policies
  final List<Policy> keep;

  /// 'Purge' retention policies
  final List<Policy> purge;

  RetentionPolicy({this.keep = const [], this.purge = const []});

  factory RetentionPolicy.fromMap(Map<String, dynamic> data) => RetentionPolicy(
      keep: (data['keep']?[0]['policy'] is Iterable)
          ? (data['keep'][0]['policy'] as Iterable)
              .map<Policy>((policy) => Policy.fromMap(policy))
              .toList(growable: false)
          : const [],
      purge: (data['purge']?[0]['policy'] is Iterable)
          ? (data['purge'][0]['policy'] as Iterable)
              .map<Policy>((policy) => Policy.fromMap(policy))
              .toList(growable: false)
          : const []);

  Map<String, dynamic> toMap() => {
        if (keep.isNotEmpty)
          'keep': [
            {'policy': keep.map((policy) => policy.toMap()).toList(growable: false)}
          ],
        if (purge.isNotEmpty)
          'purge': [
            {'policy': purge.map((policy) => policy.toMap()).toList(growable: false)}
          ],
      };
}
