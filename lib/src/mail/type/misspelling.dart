// Copyright 2022-present by Nguyen Van Nguyen <nguyennv1981@gmail.com>. All rights reserved.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

/// Information for misspelled words
class Misspelling {
  /// Misspelled word
  final String? word;

  /// Comma separated list of suggestions.
  /// Suggested words are listed in decreasing order of their match score.
  final String? suggestions;

  const Misspelling({this.word, this.suggestions});

  factory Misspelling.fromMap(Map<String, dynamic> data) => Misspelling(
        word: data['word'],
        suggestions: data['suggestions'],
      );

  Map<String, dynamic> toMap() => {
        if (word != null) 'word': word,
        if (suggestions != null) 'suggestions': suggestions,
      };
}
