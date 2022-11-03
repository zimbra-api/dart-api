import 'package:faker/faker.dart';
import 'package:test/test.dart';
import 'package:zimbra_api/src/common/enum/browse_by.dart';
import 'package:zimbra_api/src/mail/message/browse_envelope.dart';
import 'package:zimbra_api/src/mail/message/browse_request.dart';

void main() {
  final faker = Faker();

  group('Browse tests', (() {
    test('Browse request', (() {
      final regex = faker.lorem.word();
      final max = faker.randomGenerator.integer(100);
      final request = BrowseRequest(BrowseBy.domains, regex: regex, max: max);

      expect(request.getEnvelope().toMap(), {
        'Body': {
          'BrowseRequest': {
            '_jsns': 'urn:zimbraMail',
            'browseBy': BrowseBy.domains.name,
            'regex': regex,
            'maxToReturn': max,
          }
        },
      });
    }));

    test('Browse response', (() {
      final browseDomainHeader = faker.lorem.word();
      final frequency = faker.randomGenerator.integer(100);
      final content = faker.lorem.word();

      final data = {
        'Body': {
          'BrowseResponse': {
            '_jsns': 'urn:zimbraMail',
            'bd': [
              {
                'h': browseDomainHeader,
                'freq': frequency,
                '_content': content,
              }
            ],
          }
        }
      };
      final envelope = BrowseEnvelope.fromMap(data);
      final response = envelope.browseBody.browseResponse!;
      final bd = response.browseDatas.first;

      expect(bd.browseDomainHeader, browseDomainHeader);
      expect(bd.frequency, frequency);
      expect(bd.data, content);
    }));
  }));
}
