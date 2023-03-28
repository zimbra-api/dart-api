// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import '../../common/type/soap_response.dart';
import '../type/comment_info.dart';
import '../type/id_email_name.dart';

class GetCommentsResponse extends SoapResponse {
  /// Users
  final List<IdEmailName> users;

  /// Comment information
  final List<CommentInfo> comments;

  GetCommentsResponse({this.users = const [], this.comments = const []});

  factory GetCommentsResponse.fromMap(
    Map<String, dynamic> data,
  ) =>
      GetCommentsResponse(
        users: (data['user'] is Iterable)
            ? (data['user'] as Iterable)
                .map<IdEmailName>(
                  (user) => IdEmailName.fromMap(user),
                )
                .toList(growable: false)
            : const [],
        comments: (data['comment'] is Iterable)
            ? (data['comment'] as Iterable)
                .map<CommentInfo>((comment) => CommentInfo.fromMap(comment))
                .toList(growable: false)
            : const [],
      );
}
