import 'package:faker/faker.dart';
import 'package:test/test.dart';
import 'package:zimbra_api/src/account/message/delete_identity_envelope.dart';
import 'package:zimbra_api/src/account/message/delete_identity_request.dart';
import 'package:zimbra_api/src/account/message/delete_identity_response.dart';
import 'package:zimbra_api/src/account/type/name_id.dart';

void main() {
  final faker = Faker();

  group('Delete identity tests', (() {
    test('Delete identity request', (() {
      final name = faker.lorem.word();
      final id = faker.guid.guid();

      final identity = NameId(name: name, id: id);
      final request = DeleteIdentityRequest(identity);

      expect(request.getEnvelope().toMap(), {
        'Body': {
          'DeleteIdentityRequest': {
            '_jsns': 'urn:zimbraAccount',
            'identity': {
              'name': name,
              'id': id,
            },
          }
        }
      });
    }));

    test('Delete identity response', (() {
      final data = {
        'Body': {
          'DeleteIdentityResponse': {
            '_jsns': 'urn:zimbraAccount',
          }
        }
      };
      final envelope = DeleteIdentityEnvelope.fromMap(data);
      expect(envelope.body.response, isNotNull);
      expect(envelope.body.response, isA<DeleteIdentityResponse>());
    }));
  }));
}
