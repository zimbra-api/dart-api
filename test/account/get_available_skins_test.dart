import 'package:faker/faker.dart';
import 'package:test/test.dart';
import 'package:zimbra_api/src/account/message/get_available_skins_envelope.dart';
import 'package:zimbra_api/src/account/message/get_available_skins_request.dart';
import 'package:zimbra_api/src/account/message/get_available_skins_response.dart';

void main() {
  final faker = Faker();

  group('Get available csv formats tests', (() {
    test('Get available csv formats request', (() {
      final request = GetAvailableSkinsRequest();

      expect(request.getEnvelope().toMap(), {
        'Body': {
          'GetAvailableSkinsRequest': {
            '_jsns': 'urn:zimbraAccount',
          }
        },
      });
    }));

    test('Get available csv formats response', (() {
      final name = faker.lorem.word();
      final data = {
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
      final envelope = GetAvailableSkinsEnvelope.fromMap(data);
      final response = envelope.body.response as GetAvailableSkinsResponse;
      final skin = response.skins.first;

      expect(skin.name, name);
    }));
  }));
}
