import 'package:faker/faker.dart';
import 'package:test/test.dart';
import 'package:zimbra_api/src/account/message/get_available_skins_envelope.dart';
import 'package:zimbra_api/src/account/message/get_available_skins_request.dart';

void main() {
  final faker = Faker();

  group('Get available csv formats tests', (() {
    test('Get available csv formats request', (() {
      final request = GetAvailableSkinsRequest();

      expect(request.getEnvelope().toJson(), {
        'Body': {
          'GetAvailableSkinsRequest': {
            '_jsns': 'urn:zimbraAccount',
          }
        },
      });
    }));

    test('Get available csv formats response', (() {
      final name = faker.lorem.word();
      final json = {
        'Body': {
          'GetAvailableSkinsResponse': {
            '_jsns': 'urn:zimbraAccount',
            'skin': [
              {
                'name': name,
              }
            ],
          },
        },
      };
      final envelope = GetAvailableSkinsEnvelope.fromJson(json);
      final response = envelope.getAvailableSkinsBody.getAvailableSkinsResponse;
      final skin = response!.skins.first;

      expect(skin.name, name);
    }));
  }));
}
