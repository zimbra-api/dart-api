import 'package:faker/faker.dart';
import 'package:test/test.dart';
import 'package:zimbra_api/src/account/message/modify_identity_envelope.dart';
import 'package:zimbra_api/src/account/message/modify_identity_request.dart';
import 'package:zimbra_api/src/account/message/modify_identity_response.dart';
import 'package:zimbra_api/src/account/type/attr.dart';
import 'package:zimbra_api/src/account/type/identity.dart';

void main() {
  final faker = Faker();

  group('Modify identity tests', (() {
    test('Modify identity request', (() {
      final email = faker.internet.email();
      final id = faker.guid.guid();
      final name = faker.lorem.word();
      final value = faker.lorem.word();
      final permDenied = faker.randomGenerator.boolean();

      final identity = Identity(name: email, id: id, attrs: [Attr(name, value: value, permDenied: permDenied)]);
      final request = ModifyIdentityRequest(identity);
      expect(request.getEnvelope().toMap(), {
        'Body': {
          'ModifyIdentityRequest': {
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

    test('Modify identity response', (() {
      final data = {
        'Body': {
          'ModifyIdentityResponse': {
            '_jsns': 'urn:zimbraAccount',
          }
        }
      };
      final envelope = ModifyIdentityEnvelope.fromMap(data);
      expect(envelope.modifyIdentityBody.modifyIdentityResponse, isNotNull);
      expect(envelope.modifyIdentityBody.modifyIdentityResponse, isA<ModifyIdentityResponse>());
    }));
  }));
}
