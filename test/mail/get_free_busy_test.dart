import 'package:faker/faker.dart';
import 'package:test/test.dart';
import 'package:zimbra_api/src/mail/message/get_free_busy_envelope.dart';
import 'package:zimbra_api/src/mail/message/get_free_busy_request.dart';
import 'package:zimbra_api/src/mail/type/free_busy_user_spec.dart';

void main() {
  final faker = Faker();

  group('Get Free/Busy tests', (() {
    test('Get Free/Busy request', (() {
      final startTime = faker.date.dateTime().millisecondsSinceEpoch;
      final endTime = faker.date.dateTime().millisecondsSinceEpoch;
      final id = faker.guid.guid();
      final uid = faker.guid.guid();
      final name = faker.internet.email();
      final excludeUid = faker.guid.guid();
      final folderId = faker.randomGenerator.integer(100);

      final request = GetFreeBusyRequest(
        startTime,
        endTime,
        uid: uid,
        id: id,
        name: name,
        excludeUid: excludeUid,
        freebusyUsers: [FreeBusyUserSpec(folderId: folderId, id: id, name: name)],
      );
      expect(request.getEnvelope().toMap(), {
        'Body': {
          'GetFreeBusyRequest': {
            '_jsns': 'urn:zimbraMail',
            's': startTime,
            'e': endTime,
            'uid': uid,
            'id': id,
            'name': name,
            'excludeUid': excludeUid,
            'usr': [
              {
                'l': folderId,
                'id': id,
                'name': name,
              }
            ],
          }
        },
      });
    }));

    test('Get Free/Busy response', (() {
      final id = faker.guid.guid();
      final startTime = faker.date.dateTime().millisecondsSinceEpoch;
      final endTime = faker.date.dateTime().millisecondsSinceEpoch;
      final eventId = faker.guid.guid();
      final subject = faker.lorem.word();
      final location = faker.lorem.word();
      final isMeeting = faker.randomGenerator.boolean();
      final isRecurring = faker.randomGenerator.boolean();
      final isException = faker.randomGenerator.boolean();
      final isReminderSet = faker.randomGenerator.boolean();
      final isPrivate = faker.randomGenerator.boolean();
      final hasPermission = faker.randomGenerator.boolean();

      final data = {
        'Body': {
          'GetFreeBusyResponse': {
            '_jsns': 'urn:zimbraMail',
            'usr': [
              {
                'id': id,
                'f': [
                  {
                    's': startTime,
                    'e': endTime,
                    'eventId': eventId,
                    'subject': subject,
                    'location': location,
                    'isMeeting': isMeeting,
                    'isRecurring': isRecurring,
                    'isException': isException,
                    'isReminderSet': isReminderSet,
                    'isPrivate': isPrivate,
                    'hasPermission': hasPermission,
                  }
                ],
                'b': [
                  {
                    's': startTime,
                    'e': endTime,
                    'eventId': eventId,
                    'subject': subject,
                    'location': location,
                    'isMeeting': isMeeting,
                    'isRecurring': isRecurring,
                    'isException': isException,
                    'isReminderSet': isReminderSet,
                    'isPrivate': isPrivate,
                    'hasPermission': hasPermission,
                  }
                ],
                't': [
                  {
                    's': startTime,
                    'e': endTime,
                    'eventId': eventId,
                    'subject': subject,
                    'location': location,
                    'isMeeting': isMeeting,
                    'isRecurring': isRecurring,
                    'isException': isException,
                    'isReminderSet': isReminderSet,
                    'isPrivate': isPrivate,
                    'hasPermission': hasPermission,
                  }
                ],
                'u': [
                  {
                    's': startTime,
                    'e': endTime,
                    'eventId': eventId,
                    'subject': subject,
                    'location': location,
                    'isMeeting': isMeeting,
                    'isRecurring': isRecurring,
                    'isException': isException,
                    'isReminderSet': isReminderSet,
                    'isPrivate': isPrivate,
                    'hasPermission': hasPermission,
                  }
                ],
                'n': [
                  {
                    's': startTime,
                    'e': endTime,
                    'eventId': eventId,
                    'subject': subject,
                    'location': location,
                    'isMeeting': isMeeting,
                    'isRecurring': isRecurring,
                    'isException': isException,
                    'isReminderSet': isReminderSet,
                    'isPrivate': isPrivate,
                    'hasPermission': hasPermission,
                  }
                ],
              }
            ],
          }
        }
      };
      final envelope = GetFreeBusyEnvelope.fromMap(data);
      final response = envelope.getFreeBusyBody.getFreeBusyResponse!;
      final usr = response.freebusyUsers.first;

      expect(usr.id, id);

      final free = usr.freeSlots.first;
      expect(free.startTime, startTime);
      expect(free.endTime, endTime);
      expect(free.eventId, eventId);
      expect(free.subject, subject);
      expect(free.location, location);
      expect(free.isMeeting, isMeeting);
      expect(free.isRecurring, isRecurring);
      expect(free.isException, isException);
      expect(free.isReminderSet, isReminderSet);
      expect(free.isPrivate, isPrivate);
      expect(free.hasPermission, hasPermission);

      final busy = usr.busySlots.first;
      expect(busy.startTime, startTime);
      expect(busy.endTime, endTime);
      expect(busy.eventId, eventId);
      expect(busy.subject, subject);
      expect(busy.location, location);
      expect(busy.isMeeting, isMeeting);
      expect(busy.isRecurring, isRecurring);
      expect(busy.isException, isException);
      expect(busy.isReminderSet, isReminderSet);
      expect(busy.isPrivate, isPrivate);
      expect(busy.hasPermission, hasPermission);

      final tentative = usr.tentativeSlots.first;
      expect(tentative.startTime, startTime);
      expect(tentative.endTime, endTime);
      expect(tentative.eventId, eventId);
      expect(tentative.subject, subject);
      expect(tentative.location, location);
      expect(tentative.isMeeting, isMeeting);
      expect(tentative.isRecurring, isRecurring);
      expect(tentative.isException, isException);
      expect(tentative.isReminderSet, isReminderSet);
      expect(tentative.isPrivate, isPrivate);
      expect(tentative.hasPermission, hasPermission);

      final unavailable = usr.unavailableSlots.first;
      expect(unavailable.startTime, startTime);
      expect(unavailable.endTime, endTime);
      expect(unavailable.eventId, eventId);
      expect(unavailable.subject, subject);
      expect(unavailable.location, location);
      expect(unavailable.isMeeting, isMeeting);
      expect(unavailable.isRecurring, isRecurring);
      expect(unavailable.isException, isException);
      expect(unavailable.isReminderSet, isReminderSet);
      expect(unavailable.isPrivate, isPrivate);
      expect(unavailable.hasPermission, hasPermission);

      final nodata = usr.nodataSlots.first;
      expect(nodata.startTime, startTime);
      expect(nodata.endTime, endTime);
      expect(nodata.eventId, eventId);
      expect(nodata.subject, subject);
      expect(nodata.location, location);
      expect(nodata.isMeeting, isMeeting);
      expect(nodata.isRecurring, isRecurring);
      expect(nodata.isException, isException);
      expect(nodata.isReminderSet, isReminderSet);
      expect(nodata.isPrivate, isPrivate);
      expect(nodata.hasPermission, hasPermission);
    }));
  }));
}
