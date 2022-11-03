import 'package:faker/faker.dart';
import 'package:test/test.dart';
import 'package:zimbra_api/src/mail/message/destroy_wait_set_envelope.dart';
import 'package:zimbra_api/src/mail/message/destroy_wait_set_request.dart';
import 'package:zimbra_api/src/mail/message/destroy_wait_set_response.dart';

void main() {
  final faker = Faker();

  group('Destroy WaitSet tests', (() {
    test('Destroy WaitSet request', (() {
      final waitSetId = faker.guid.guid();
      final request = DestroyWaitSetRequest(waitSetId);
      expect(request.getEnvelope().toMap(), {
        'Body': {
          'DestroyWaitSetRequest': {
            '_jsns': 'urn:zimbraMail',
            'waitSet': waitSetId,
          }
        },
      });
    }));

    test('Destroy WaitSet response', (() {
      final waitSetId = faker.guid.guid();
      final data = {
        'Body': {
          'DestroyWaitSetResponse': {
            '_jsns': 'urn:zimbraMail',
            'waitSet': waitSetId,
          }
        }
      };
      final envelope = DestroyWaitSetEnvelope.fromMap(data);
      final response = envelope.body.response as DestroyWaitSetResponse;

      expect(response.waitSetId, waitSetId);
    }));
  }));
}
