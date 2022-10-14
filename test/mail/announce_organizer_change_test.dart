import 'package:faker/faker.dart';
import 'package:test/test.dart';
import 'package:zimbra_api/src/mail/message/announce_organizer_change_envelope.dart';
import 'package:zimbra_api/src/mail/message/announce_organizer_change_request.dart';
import 'package:zimbra_api/src/mail/message/announce_organizer_change_response.dart';

void main() {
  final faker = Faker();

  group('Announce organizer change tests', (() {
    test('Announce organizer change request', (() {
      final id = faker.guid.guid();
      final request = AnnounceOrganizerChangeRequest(id);

      expect(request.getEnvelope().toJson(), {
        'Body': {
          'AnnounceOrganizerChangeRequest': {
            '_jsns': 'urn:zimbraMail',
            'id': id,
          }
        },
      });
    }));

    test('Announce organizer change respone', (() {
      final json = {
        'Body': {
          'AnnounceOrganizerChangeResponse': {
            '_jsns': 'urn:zimbraMail',
          }
        }
      };
      final envelope = AnnounceOrganizerChangeEnvelope.fromJson(json);
      expect(envelope.announceOrganizerChangeBody.announceOrganizerChangeResponse, isNotNull);
      expect(
          envelope.announceOrganizerChangeBody.announceOrganizerChangeResponse, isA<AnnounceOrganizerChangeResponse>());
    }));
  }));
}
