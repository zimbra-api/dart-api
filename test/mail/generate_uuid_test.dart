import 'package:faker/faker.dart';
import 'package:test/test.dart';
import 'package:zimbra_api/src/mail/message/generate_uuid_envelope.dart';
import 'package:zimbra_api/src/mail/message/generate_uuid_request.dart';

void main() {
  final faker = Faker();

  group('Generate UUID tests', (() {
    test('Generate UUID request', (() {
      final request = GenerateUUIDRequest();
      expect(request.getEnvelope().toJson(), {
        'Body': {
          'GenerateUUIDRequest': {
            '_jsns': 'urn:zimbraMail',
          }
        },
      });
    }));

    test('Generate UUID response', (() {
      final uuid = faker.guid.guid();
      final json = {
        'Body': {
          'GenerateUUIDResponse': {
            '_jsns': 'urn:zimbraMail',
            '_content': uuid,
          }
        }
      };
      final envelope = GenerateUUIDEnvelope.fromJson(json);
      expect(envelope.generateUUIDBody.generateUUIDResponse!.uuid, uuid);
    }));
  }));
}
