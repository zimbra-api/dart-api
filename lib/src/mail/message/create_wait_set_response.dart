// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import 'package:zimbra_api/src/common/type/id_and_type.dart';
import 'package:zimbra_api/src/common/type/soap_response.dart';

class CreateWaitSetResponse extends SoapResponse {
  /// WaitSet ID
  final String? waitSetId;

  /// Default interest types: comma-separated list. Currently:
  /// f: folders
  /// m: messages
  /// c: contacts
  /// a: appointments
  /// t: tasks
  /// d: documents
  /// all: all types (equiv to 'f,m,c,a,t,d')
  ///
  /// This is used if types isn't specified for an account
  final String? defaultInterests;

  /// Sequence
  final int? sequence;

  /// Error information
  final List<IdAndType> errors;

  CreateWaitSetResponse({this.waitSetId, this.defaultInterests, this.sequence, this.errors = const []});

  factory CreateWaitSetResponse.fromJson(Map<String, dynamic> json) => CreateWaitSetResponse(
      waitSetId: json['waitSet'],
      defaultInterests: json['defTypes'],
      sequence: json['seq'],
      errors: (json['error'] is Iterable)
          ? List.from((json['error'] as Iterable).map<IdAndType>((error) => IdAndType.fromJson(error)))
          : []);
}
