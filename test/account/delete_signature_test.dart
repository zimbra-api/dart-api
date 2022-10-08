import 'package:faker/faker.dart';
import 'package:test/test.dart';
import 'package:zimbra_api/src/account/message/delete_signature_envelope.dart';
import 'package:zimbra_api/src/account/message/delete_signature_request.dart';
import 'package:zimbra_api/src/account/message/delete_signature_response.dart';
import 'package:zimbra_api/src/account/type/name_id.dart';

void main() {
  final faker = Faker();

  group('Delete signature tests', (() {
    test('Delete signature request', (() {
      final name = faker.lorem.word();
      final id = faker.guid.guid();

      final signature = NameId(name: name, id: id);
      final request = DeleteSignatureRequest(signature);

      expect(request.getEnvelope().toJson(), {
        'Body': {
          'DeleteSignatureRequest': {
            '_jsns': 'urn:zimbraAccount',
            'signature': {
              'name': name,
              'id': id,
            },
          }
        }
      });
    }));

    test('Delete signature response', (() {
      final json = {
        'Body': {
          'DeleteSignatureResponse': {
            '_jsns': 'urn:zimbraAccount',
          }
        }
      };
      final envelope = DeleteSignatureEnvelope.fromJson(json);
      expect(envelope.deleteSignatureBody.deleteSignatureResponse, isNotNull);
      expect(envelope.deleteSignatureBody.deleteSignatureResponse, isA<DeleteSignatureResponse>());
    }));
  }));
}
