import 'package:faker/faker.dart';
import 'package:test/test.dart';
import 'package:zimbra_api/src/mail/message/get_import_status_envelope.dart';
import 'package:zimbra_api/src/mail/message/get_import_status_request.dart';

void main() {
  final faker = Faker();

  group('Get import status tests', (() {
    test('Get import status request', (() {
      final request = GetImportStatusRequest();
      expect(request.getEnvelope().toMap(), {
        'Body': {
          'GetImportStatusRequest': {
            '_jsns': 'urn:zimbraMail',
          }
        },
      });
    }));

    test('Get import status response', (() {
      final id = faker.guid.guid();
      final isRunning = faker.randomGenerator.boolean();
      final success = faker.randomGenerator.boolean();
      final error = faker.lorem.word();

      final data = {
        'Body': {
          'GetImportStatusResponse': {
            '_jsns': 'urn:zimbraMail',
            'imap': [
              {
                'id': id,
                'isRunning': isRunning,
                'success': success,
                'error': error,
              }
            ],
            'pop3': [
              {
                'id': id,
                'isRunning': isRunning,
                'success': success,
                'error': error,
              }
            ],
            'caldav': [
              {
                'id': id,
                'isRunning': isRunning,
                'success': success,
                'error': error,
              }
            ],
            'yab': [
              {
                'id': id,
                'isRunning': isRunning,
                'success': success,
                'error': error,
              }
            ],
            'rss': [
              {
                'id': id,
                'isRunning': isRunning,
                'success': success,
                'error': error,
              }
            ],
            'gal': [
              {
                'id': id,
                'isRunning': isRunning,
                'success': success,
                'error': error,
              }
            ],
            'cal': [
              {
                'id': id,
                'isRunning': isRunning,
                'success': success,
                'error': error,
              }
            ],
            'unknown': [
              {
                'id': id,
                'isRunning': isRunning,
                'success': success,
                'error': error,
              }
            ],
          }
        }
      };
      final envelope = GetImportStatusEnvelope.fromMap(data);
      final response = envelope.getImportStatusBody.getImportStatusResponse!;

      final imap = response.imapStatuses.first;
      expect(imap.id, id);
      expect(imap.isRunning, isRunning);
      expect(imap.success, success);
      expect(imap.error, error);

      final pop3 = response.pop3Statuses.first;
      expect(pop3.id, id);
      expect(pop3.isRunning, isRunning);
      expect(pop3.success, success);
      expect(pop3.error, error);

      final caldav = response.caldavStatuses.first;
      expect(caldav.id, id);
      expect(caldav.isRunning, isRunning);
      expect(caldav.success, success);
      expect(caldav.error, error);

      final yab = response.yabStatuses.first;
      expect(yab.id, id);
      expect(yab.isRunning, isRunning);
      expect(yab.success, success);
      expect(yab.error, error);

      final rss = response.rssStatuses.first;
      expect(rss.id, id);
      expect(rss.isRunning, isRunning);
      expect(rss.success, success);
      expect(rss.error, error);

      final gal = response.galStatuses.first;
      expect(gal.id, id);
      expect(gal.isRunning, isRunning);
      expect(gal.success, success);
      expect(gal.error, error);

      final cal = response.calStatuses.first;
      expect(cal.id, id);
      expect(cal.isRunning, isRunning);
      expect(cal.success, success);
      expect(cal.error, error);

      final unknown = response.unknownStatuses.first;
      expect(unknown.id, id);
      expect(unknown.isRunning, isRunning);
      expect(unknown.success, success);
      expect(unknown.error, error);
    }));
  }));
}
