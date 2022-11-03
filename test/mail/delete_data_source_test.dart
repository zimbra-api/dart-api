import 'package:faker/faker.dart';
import 'package:test/test.dart';
import 'package:zimbra_api/src/mail/message/delete_data_source_envelope.dart';
import 'package:zimbra_api/src/mail/message/delete_data_source_request.dart';
import 'package:zimbra_api/src/mail/message/delete_data_source_response.dart';
import 'package:zimbra_api/src/mail/type/data_source_name_or_id.dart';

void main() {
  final faker = Faker();

  group('Delete data source tests', (() {
    test('Delete data source request', (() {
      final id = faker.guid.guid();
      final name = faker.lorem.word();

      final request = DeleteDataSourceRequest(
        imapDataSources: [DataSourceNameOrId(id: id, name: name)],
        pop3DataSources: [DataSourceNameOrId(id: id, name: name)],
        caldavDataSources: [DataSourceNameOrId(id: id, name: name)],
        yabDataSources: [DataSourceNameOrId(id: id, name: name)],
        rssDataSources: [DataSourceNameOrId(id: id, name: name)],
        galDataSources: [DataSourceNameOrId(id: id, name: name)],
        calDataSources: [DataSourceNameOrId(id: id, name: name)],
        unknownDataSources: [DataSourceNameOrId(id: id, name: name)],
      );
      expect(request.getEnvelope().toMap(), {
        'Body': {
          'DeleteDataSourceRequest': {
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

    test('Delete data source response', (() {
      final data = {
        'Body': {
          'DeleteDataSourceResponse': {
            '_jsns': 'urn:zimbraMail',
          }
        }
      };
      final envelope = DeleteDataSourceEnvelope.fromMap(data);
      expect(envelope.deleteDataSourceBody.deleteDataSourceResponse, isNotNull);
      expect(envelope.deleteDataSourceBody.deleteDataSourceResponse, isA<DeleteDataSourceResponse>());
    }));
  }));
}
