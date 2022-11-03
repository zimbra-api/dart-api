import 'package:faker/faker.dart';
import 'package:test/test.dart';
import 'package:zimbra_api/src/mail/message/check_spelling_envelope.dart';
import 'package:zimbra_api/src/mail/message/check_spelling_request.dart';

void main() {
  final faker = Faker();

  group('Check spelling tests', (() {
    test('Check spelling request', (() {
      final dictionary = faker.lorem.word();
      final ignoreList = faker.lorem.word();
      final text = faker.lorem.word();
      final request = CheckSpellingRequest(
        dictionary: dictionary,
        ignoreList: ignoreList,
        text: text,
      );

      expect(request.getEnvelope().toMap(), {
        'Body': {
          'CheckSpellingRequest': {
            '_jsns': 'urn:zimbraMail',
            'dictionary': dictionary,
            'ignore': ignoreList,
            '_content': text,
          }
        },
      });
    }));

    test('Check spelling response', (() {
      final available = faker.randomGenerator.boolean();
      final word = faker.lorem.word();
      final suggestions = faker.lorem.words(3).join(',');
      final data = {
        'Body': {
          'CheckSpellingResponse': {
            '_jsns': 'urn:zimbraMail',
            'available': available,
            'misspelled': [
              {
                'word': word,
                'suggestions': suggestions,
              }
            ],
          }
        }
      };
      final envelope = CheckSpellingEnvelope.fromMap(data);
      final response = envelope.checkSpellingBody.checkSpellingResponse!;
      final misspelled = response.misspelledWords.first;

      expect(response.available, available);
      expect(misspelled.word, word);
      expect(misspelled.suggestions, suggestions);
    }));
  }));
}
