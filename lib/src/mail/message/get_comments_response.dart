// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_response.dart';
import 'package:zimbra_api/src/mail/type/comment_info.dart';
import 'package:zimbra_api/src/mail/type/id_email_name.dart';

class GetCommentsResponse extends SoapResponse {
  /// Users
  final List<IdEmailName> users;

  /// Comment information
  final List<CommentInfo> comments;

  GetCommentsResponse({this.users = const [], this.comments = const []});

  factory GetCommentsResponse.fromJson(Map<String, dynamic> json) => GetCommentsResponse(
      users: (json['user'] is Iterable)
          ? List.from((json['user'] as Iterable).map<IdEmailName>((user) => IdEmailName.fromJson(user)))
          : [],
      comments: (json['comment'] is Iterable)
          ? List.from((json['comment'] as Iterable).map<CommentInfo>((comment) => CommentInfo.fromJson(comment)))
          : []);
}
