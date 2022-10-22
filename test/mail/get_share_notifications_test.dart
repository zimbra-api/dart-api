import 'package:faker/faker.dart';
import 'package:test/test.dart';
import 'package:zimbra_api/src/mail/message/get_share_notifications_envelope.dart';
import 'package:zimbra_api/src/mail/message/get_share_notifications_request.dart';

void main() {
  final faker = Faker();

  group('Get share notifications tests', (() {
    test('Get share notifications request', (() {
      final request = GetShareNotificationsRequest();
      expect(request.getEnvelope().toJson(), {
        'Body': {
          'GetShareNotificationsRequest': {
            '_jsns': 'urn:zimbraMail',
          }
        },
      });
    }));

    test('Get share notifications response', (() {
      final id = faker.guid.guid();
      final uuid = faker.guid.guid();
      final name = faker.lorem.word();
      final email = faker.internet.email();
      final status = faker.lorem.word();
      final date = faker.date.dateTime().millisecondsSinceEpoch;
      final defaultView = faker.lorem.word();
      final rights = faker.lorem.word();

      final json = {
        'Body': {
          'GetShareNotificationsResponse': {
            '_jsns': 'urn:zimbraMail',
            'share': [
              {
                'status': status,
                'id': id,
                'd': date,
                'grantor': {
                  'id': id,
                  'email': email,
                  'name': name,
                },
                'link': {
                  'id': id,
                  'uuid': uuid,
                  'name': name,
                  'view': defaultView,
                  'perm': rights,
                },
              }
            ],
          }
        }
      };
      final envelope = GetShareNotificationsEnvelope.fromJson(json);
      final respnse = envelope.getShareNotificationsBody.getShareNotificationsResponse!;
      final share = respnse.shares.first;

      expect(share.status, status);
      expect(share.id, id);
      expect(share.date, date);

      final grantor = share.grantor!;
      expect(grantor.id, id);
      expect(grantor.email, email);
      expect(grantor.name, name);

      final link = share.link!;
      expect(link.id, id);
      expect(link.uuid, uuid);
      expect(link.name, name);
      expect(link.defaultView, defaultView);
      expect(link.rights, rights);
    }));
  }));
}
