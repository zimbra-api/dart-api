import 'package:faker/faker.dart';
import 'package:test/test.dart';
import 'package:zimbra_api/src/mail/message/import_data_envelope.dart';
import 'package:zimbra_api/src/mail/message/import_data_request.dart';
import 'package:zimbra_api/src/mail/message/import_data_response.dart';
import 'package:zimbra_api/src/mail/type/data_source_name_or_id.dart';

void main() {
  final faker = Faker();

  group('Import data tests', (() {
    test('Import data request', (() {
      final id = faker.guid.guid();
      final name = faker.lorem.word();

      final request = ImportDataRequest(
        imapDataSources: [DataSourceNameOrId(id: id, name: name)],
        pop3DataSources: [DataSourceNameOrId(id: id, name: name)],
        caldavDataSources: [DataSourceNameOrId(id: id, name: name)],
        yabDataSources: [DataSourceNameOrId(id: id, name: name)],
        rssDataSources: [DataSourceNameOrId(id: id, name: name)],
        galDataSources: [DataSourceNameOrId(id: id, name: name)],
        calDataSources: [DataSourceNameOrId(id: id, name: name)],
        unknownDataSources: [DataSourceNameOrId(id: id, name: name)],
      );
      expect(request.getEnvelope().toJson(), {
        'Body': {
          'ImportDataRequest': {
            '_jsns': 'urn:zimbraMail',
            'imap': [
              {
                'name': name,
                'id': id,
              }
            ],
            'pop3': [
              {
                'name': name,
                'id': id,
              }
            ],
            'caldav': [
              {
                'name': name,
                'id': id,
              }
            ],
            'yab': [
              {
                'name': name,
                'id': id,
              }
            ],
            'rss': [
              {
                'name': name,
                'id': id,
              }
            ],
            'gal': [
              {
                'name': name,
                'id': id,
              }
            ],
            'cal': [
              {
                'name': name,
                'id': id,
              }
            ],
            'unknown': [
              {
                'name': name,
                'id': id,
              }
            ],
          }
        },
      });
    }));

    test('Import data response', (() {
      final json = {
        'Body': {
          'ImportDataResponse': {
            '_jsns': 'urn:zimbraMail',
          }
        }
      };
      final envelope = ImportDataEnvelope.fromJson(json);
      final response = envelope.importDataBody.importDataResponse;
      expect(response, isNotNull);
      expect(response, isA<ImportDataResponse>());
    }));
  }));
}
