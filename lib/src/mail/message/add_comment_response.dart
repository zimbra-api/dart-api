// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/id.dart';
import 'package:zimbra_api/src/common/type/soap_response.dart';

class AddCommentResponse extends SoapResponse {
  /// Item ID for the comment
  final Id? comment;

  AddCommentResponse({this.comment});

  factory AddCommentResponse.fromJson(Map<String, dynamic> json) =>
      AddCommentResponse(comment: json['comment'] is Map ? Id.fromJson(json['comment']) : null);
}
