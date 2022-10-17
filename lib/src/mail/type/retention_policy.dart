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

  factory RetentionPolicy.fromJson(Map<String, dynamic> json) => RetentionPolicy(
      keep: (json['keep']?['policy'] is Iterable)
          ? List.from((json['keep']['policy'] as Iterable).map<Policy>((policy) => Policy.fromJson(policy)))
          : [],
      purge: (json['purge']?['policy'] is Iterable)
          ? List.from((json['purge']['policy'] as Iterable).map<Policy>((policy) => Policy.fromJson(policy)))
          : []);

  Map<String, dynamic> toJson() => {
        if (keep.isNotEmpty) 'keep': {'policy': keep.map((policy) => policy.toJson()).toList()},
        if (purge.isNotEmpty) 'purge': {'policy': purge.map((policy) => policy.toJson()).toList()},
      };
}
