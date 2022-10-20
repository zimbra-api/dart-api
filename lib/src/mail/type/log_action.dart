// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/enum/logging_level.dart';

import 'filter_action.dart';

class LogAction extends FilterAction {
  /// level - fatal|error|warn|info|debug|trace, info is default if not specified.
  final LoggingLevel? level;

  /// message text
  final String? content;

  LogAction({this.level, this.content, super.index});

  factory LogAction.fromJson(Map<String, dynamic> json) => LogAction(
      level: LoggingLevel.values.firstWhere(
        (level) => level.name == json['level'],
        orElse: () => LoggingLevel.info,
      ),
      content: json['_content'],
      index: json['index']);

  @override
  Map<String, dynamic> toJson() => {
        if (level != null) 'level': level!.name,
        if (content != null) '_content': content,
        if (index != null) 'index': index,
      };
}
