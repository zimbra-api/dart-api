// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'discover_rights_target.dart';

class DiscoverRightsInfo {
  /// Right the targets relate to
  final String right;

  /// Targets
  final List<DiscoverRightsTarget> targets;

  DiscoverRightsInfo(this.right, {this.targets = const []});

  factory DiscoverRightsInfo.fromJson(Map<String, dynamic> json) => DiscoverRightsInfo(
        json['right'],
        targets: (json['target'] is Iterable)
            ? List.from((json['target'] as Iterable)
                .map<DiscoverRightsTarget>((target) => DiscoverRightsTarget.fromJson(target)))
            : [],
      );

  Map<String, dynamic> toJson() => {
        'right': right,
        if (targets.isNotEmpty) 'target': targets.map((target) => target.toJson()),
      };
}
