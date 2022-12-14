import 'package:faker/faker.dart';
import 'package:test/test.dart';
import 'package:zimbra_api/src/account/message/get_identities_envelope.dart';
import 'package:zimbra_api/src/account/message/get_identities_request.dart';
import 'package:zimbra_api/src/account/message/get_identities_response.dart';

void main() {
  final faker = Faker();

  group('Get identities tests', (() {
    test('Get identities request', (() {
      final request = GetIdentitiesRequest();

      expect(request.getEnvelope().toMap(), {
        'Body': {
          'GetIdentitiesRequest': {
            '_jsns': 'urn:zimbraAccount',
          }
        },
      });
    }));

    test('Get identities response', (() {
      final email = faker.internet.email();
      final id = faker.guid.guid();
      final name = faker.lorem.word();
      final value = faker.lorem.word();
      // final permDenied = faker.randomGenerator.boolean();

      final data = {
        'Body': {
          'GetIdentitiesResponse': {
            '_jsns': 'urn:zimbraAccount',
            'identity': [
              {
                'name': email,
                'id': id,
                '_attrs': {
                  name: value,
                },
              }
            ],
          }
        }
      };
      final envelope = GetIdentitiesEnvelope.fromMap(data);
      final response = envelope.body.response as GetIdentitiesResponse;
      final identity = response.identities.first;

      expect(identity.name, email);
      expect(identity.id, id);

      final attr = identity.attrs.first;
      expect(attr.name, name);
      // expect(attr.permDenied, permDenied);
      expect(attr.value, value);
    }));
  }));
}
