import 'package:faker/faker.dart';
import 'package:test/test.dart';
import 'package:zimbra_api/src/account/message/create_identity_envelope.dart';
import 'package:zimbra_api/src/account/message/create_identity_request.dart';
import 'package:zimbra_api/src/account/type/attr.dart';
import 'package:zimbra_api/src/account/type/identity.dart';

void main() {
  final faker = Faker();

  group('Create identity tests', (() {
    test('Create identity request', (() {
      final email = faker.internet.email();
      final id = faker.guid.guid();
      final name = faker.lorem.word();
      final value = faker.lorem.word();
      final permDenied = faker.randomGenerator.boolean();

      final request =
          CreateIdentityRequest(Identity(name: email, id: id, attrs: [Attr(name, value, permDenied: permDenied)]));
      expect(request.getEnvelope().toJson(), {
        'Body': {
          'CreateIdentityRequest': {
            '_jsns': 'urn:zimbraAccount',
            'identity': {
              'name': email,
              'id': id,
              'a': [
                {
                  'name': name,
                  'pd': permDenied,
                  '_content': value,
                },
              ],
            },
          }
        }
      });
    }));

    test('Create identity response', (() {
      final email = faker.internet.email();
      final id = faker.guid.guid();
      final name = faker.lorem.word();
      final value = faker.lorem.word();
      final permDenied = faker.randomGenerator.boolean();

      final json = {
        'Body': {
          'CreateIdentityResponse': {
            '_jsns': 'urn:zimbraAccount',
            'identity': {
              'name': email,
              'id': id,
              'a': [
                {
                  'name': name,
                  'pd': permDenied,
                  '_content': value,
                },
              ],
            },
          }
        }
      };
      final envelope = CreateIdentityEnvelope.fromJson(json);
      final response = envelope.createIdentityBody.createIdentityResponse!;
      final identity = response.identity!;

      expect(identity.name, email);
      expect(identity.id, id);

      final attr = identity.attrs.first;
      expect(attr.name, name);
      expect(attr.permDenied, permDenied);
      expect(attr.value, value);
    }));
  }));
}
