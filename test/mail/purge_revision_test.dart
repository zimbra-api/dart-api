import 'package:faker/faker.dart';
import 'package:test/test.dart';
import 'package:zimbra_api/src/mail/message/purge_revision_envelope.dart';
import 'package:zimbra_api/src/mail/message/purge_revision_request.dart';
import 'package:zimbra_api/src/mail/message/purge_revision_response.dart';
import 'package:zimbra_api/src/mail/type/purge_revision_spec.dart';

void main() {
  final faker = Faker();

  group('Purge revision tests', (() {
    test('Purge revision request', (() {
      final id = faker.guid.guid();
      final version = faker.randomGenerator.integer(100);
      final includeOlderRevisions = faker.randomGenerator.boolean();

      final request = PurgeRevisionRequest(
        PurgeRevisionSpec(
          id,
          version,
          includeOlderRevisions: includeOlderRevisions,
        ),
      );
      expect(request.getEnvelope().toMap(), {
        'Body': {
          'PurgeRevisionRequest': {
            '_jsns': 'urn:zimbraMail',
            'revision': {
              'id': id,
              'ver': version,
              'includeOlderRevisions': includeOlderRevisions,
            },
          }
        },
      });
    }));

    test('Purge revision response', (() {
      final data = {
        'Body': {
          'PurgeRevisionResponse': {
            '_jsns': 'urn:zimbraMail',
          }
        }
      };
      final envelope = PurgeRevisionEnvelope.fromMap(data);
      expect(envelope.body.response, isNotNull);
      expect(envelope.body.response, isA<PurgeRevisionResponse>());
    }));
  }));
}
