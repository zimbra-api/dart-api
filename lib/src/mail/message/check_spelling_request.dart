// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import '../../common/type/soap_header.dart';
import '../../common/type/soap_envelope.dart';
import '../../common/type/soap_request.dart';
import 'check_spelling_body.dart';
import 'check_spelling_envelope.dart';

/// Check spelling.
/// Suggested words are listed in decreasing order of their match score.
/// The "available" attribute specifies whether the server-side spell checking interface is available or not.
class CheckSpellingRequest extends SoapRequest {
  /// The optional name of the aspell dictionary that will be used to check spelling.
  /// If not specified, the the dictionary will be either zimbraPrefSpellDictionary or the one for the
  /// account's locale, in that order.
  final String? dictionary;

  /// Comma-separated list of words to ignore just for this request.
  /// These words are added to the user's personal dictionary of ignore words stored as zimbraPrefSpellIgnoreWord.
  final String? ignoreList;

  /// Text to spell check
  final String? text;

  CheckSpellingRequest({this.dictionary, this.ignoreList, this.text});

  @override
  SoapEnvelope getEnvelope({SoapHeader? header}) =>
      CheckSpellingEnvelope(CheckSpellingBody(request: this), header: header);

  @override
  Map<String, dynamic> toMap() => {
        '_jsns': 'urn:zimbraMail',
        if (dictionary != null) 'dictionary': dictionary,
        if (ignoreList != null) 'ignore': ignoreList,
        if (text != null) '_content': text,
      };
}
