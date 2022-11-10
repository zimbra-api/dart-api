// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/soap_response.dart';
import 'package:zimbra_api/src/mail/type/disposition_and_text.dart';

class DiffDocumentResponse extends SoapResponse {
  /// Difference information in chunks
  final List<DispositionAndText> chunks;

  DiffDocumentResponse({this.chunks = const []});

  factory DiffDocumentResponse.fromMap(Map<String, dynamic> data) => DiffDocumentResponse(
      chunks: (data['chunk'] is Iterable)
          ? (data['chunk'] as Iterable)
              .map<DispositionAndText>((chunk) => DispositionAndText.fromMap(chunk))
              .toList(growable: false)
          : const []);
}
