import 'package:faker/faker.dart';
import 'package:test/test.dart';
import 'package:zimbra_api/src/common/enum/connection_type.dart';
import 'package:zimbra_api/src/mail/message/test_data_source_envelope.dart';
import 'package:zimbra_api/src/mail/message/test_data_source_request.dart';
import 'package:zimbra_api/src/mail/message/test_data_source_response.dart';
import 'package:zimbra_api/src/mail/type/mail_cal_data_source.dart';
import 'package:zimbra_api/src/mail/type/mail_caldav_data_source.dart';
import 'package:zimbra_api/src/mail/type/mail_gal_data_source.dart';
import 'package:zimbra_api/src/mail/type/mail_imap_data_source.dart';
import 'package:zimbra_api/src/mail/type/mail_pop3_data_source.dart';
import 'package:zimbra_api/src/mail/type/mail_rss_data_source.dart';
import 'package:zimbra_api/src/mail/type/mail_unknown_data_source.dart';
import 'package:zimbra_api/src/mail/type/mail_yab_data_source.dart';

void main() {
  final faker = Faker();

  group('Test data source tests', (() {
    test('Test data source request', (() {
      final id = faker.guid.guid();
      final name = faker.lorem.word();
      final folderId = faker.guid.guid();
      final isEnabled = faker.randomGenerator.boolean();
      final importOnly = faker.randomGenerator.boolean();
      final host = faker.internet.ipv4Address();
      final port = faker.randomGenerator.integer(100);
      final username = faker.internet.userName();
      final password = faker.internet.password();
      final pollingInterval = faker.lorem.word();
      final emailAddress = faker.internet.email();
      final smtpEnabled = faker.randomGenerator.boolean();
      final smtpHost = faker.internet.ipv4Address();
      final smtpPort = faker.randomGenerator.integer(100);
      final smtpAuthRequired = faker.randomGenerator.boolean();
      final smtpUsername = faker.internet.userName();
      final smtpPassword = faker.internet.password();
      final useAddressForForwardReply = faker.randomGenerator.boolean();
      final defaultSignature = faker.lorem.word();
      final forwardReplySignature = faker.lorem.word();
      final fromDisplay = faker.lorem.word();
      final replyToAddress = faker.internet.email();
      final replyToDisplay = faker.person.name();
      final importClass = faker.lorem.word();
      final failingSince = faker.randomGenerator.integer(100);
      final lastError = faker.lorem.word();
      final attribute = faker.lorem.word();
      final refreshToken = faker.guid.guid();
      final refreshTokenUrl = faker.internet.httpsUrl();
      final leaveOnServer = faker.randomGenerator.boolean();
      final oauthToken = faker.guid.guid();
      final clientId = faker.guid.guid();
      final clientSecret = faker.guid.guid();
      final test = faker.randomGenerator.boolean();

      final request = TestDataSourceRequest(
        imapDataSource: MailImapDataSource(
          id: id,
          name: name,
          folderId: folderId,
          isEnabled: isEnabled,
          importOnly: importOnly,
          host: host,
          port: port,
          connectionType: ConnectionType.clearText,
          username: username,
          password: password,
          pollingInterval: pollingInterval,
          emailAddress: emailAddress,
          smtpEnabled: smtpEnabled,
          smtpHost: smtpHost,
          smtpPort: smtpPort,
          smtpConnectionType: ConnectionType.clearText,
          smtpAuthRequired: smtpAuthRequired,
          smtpUsername: smtpUsername,
          smtpPassword: smtpPassword,
          useAddressForForwardReply: useAddressForForwardReply,
          defaultSignature: defaultSignature,
          forwardReplySignature: forwardReplySignature,
          fromDisplay: fromDisplay,
          replyToAddress: replyToAddress,
          replyToDisplay: replyToDisplay,
          importClass: importClass,
          failingSince: failingSince,
          lastError: lastError,
          refreshToken: refreshToken,
          refreshTokenUrl: refreshTokenUrl,
          oauthToken: oauthToken,
          clientId: clientId,
          clientSecret: clientSecret,
          test: test,
          attributes: [attribute],
        ),
        pop3DataSource: MailPop3DataSource(
          id: id,
          name: name,
          folderId: folderId,
          isEnabled: isEnabled,
          importOnly: importOnly,
          host: host,
          port: port,
          connectionType: ConnectionType.clearText,
          username: username,
          password: password,
          pollingInterval: pollingInterval,
          emailAddress: emailAddress,
          smtpEnabled: smtpEnabled,
          smtpHost: smtpHost,
          smtpPort: smtpPort,
          smtpConnectionType: ConnectionType.clearText,
          smtpAuthRequired: smtpAuthRequired,
          smtpUsername: smtpUsername,
          smtpPassword: smtpPassword,
          useAddressForForwardReply: useAddressForForwardReply,
          defaultSignature: defaultSignature,
          forwardReplySignature: forwardReplySignature,
          fromDisplay: fromDisplay,
          replyToAddress: replyToAddress,
          replyToDisplay: replyToDisplay,
          importClass: importClass,
          failingSince: failingSince,
          lastError: lastError,
          refreshToken: refreshToken,
          refreshTokenUrl: refreshTokenUrl,
          leaveOnServer: leaveOnServer,
          attributes: [attribute],
        ),
        caldavDataSource: MailCaldavDataSource(
          id: id,
          name: name,
          folderId: folderId,
          isEnabled: isEnabled,
          importOnly: importOnly,
          host: host,
          port: port,
          connectionType: ConnectionType.clearText,
          username: username,
          password: password,
          pollingInterval: pollingInterval,
          emailAddress: emailAddress,
          smtpEnabled: smtpEnabled,
          smtpHost: smtpHost,
          smtpPort: smtpPort,
          smtpConnectionType: ConnectionType.clearText,
          smtpAuthRequired: smtpAuthRequired,
          smtpUsername: smtpUsername,
          smtpPassword: smtpPassword,
          useAddressForForwardReply: useAddressForForwardReply,
          defaultSignature: defaultSignature,
          forwardReplySignature: forwardReplySignature,
          fromDisplay: fromDisplay,
          replyToAddress: replyToAddress,
          replyToDisplay: replyToDisplay,
          importClass: importClass,
          failingSince: failingSince,
          lastError: lastError,
          refreshToken: refreshToken,
          refreshTokenUrl: refreshTokenUrl,
          attributes: [attribute],
        ),
        yabDataSource: MailYabDataSource(
          id: id,
          name: name,
          folderId: folderId,
          isEnabled: isEnabled,
          importOnly: importOnly,
          host: host,
          port: port,
          connectionType: ConnectionType.clearText,
          username: username,
          password: password,
          pollingInterval: pollingInterval,
          emailAddress: emailAddress,
          smtpEnabled: smtpEnabled,
          smtpHost: smtpHost,
          smtpPort: smtpPort,
          smtpConnectionType: ConnectionType.clearText,
          smtpAuthRequired: smtpAuthRequired,
          smtpUsername: smtpUsername,
          smtpPassword: smtpPassword,
          useAddressForForwardReply: useAddressForForwardReply,
          defaultSignature: defaultSignature,
          forwardReplySignature: forwardReplySignature,
          fromDisplay: fromDisplay,
          replyToAddress: replyToAddress,
          replyToDisplay: replyToDisplay,
          importClass: importClass,
          failingSince: failingSince,
          lastError: lastError,
          refreshToken: refreshToken,
          refreshTokenUrl: refreshTokenUrl,
          attributes: [attribute],
        ),
        rssDataSource: MailRssDataSource(
          id: id,
          name: name,
          folderId: folderId,
          isEnabled: isEnabled,
          importOnly: importOnly,
          host: host,
          port: port,
          connectionType: ConnectionType.clearText,
          username: username,
          password: password,
          pollingInterval: pollingInterval,
          emailAddress: emailAddress,
          smtpEnabled: smtpEnabled,
          smtpHost: smtpHost,
          smtpPort: smtpPort,
          smtpConnectionType: ConnectionType.clearText,
          smtpAuthRequired: smtpAuthRequired,
          smtpUsername: smtpUsername,
          smtpPassword: smtpPassword,
          useAddressForForwardReply: useAddressForForwardReply,
          defaultSignature: defaultSignature,
          forwardReplySignature: forwardReplySignature,
          fromDisplay: fromDisplay,
          replyToAddress: replyToAddress,
          replyToDisplay: replyToDisplay,
          importClass: importClass,
          failingSince: failingSince,
          lastError: lastError,
          refreshToken: refreshToken,
          refreshTokenUrl: refreshTokenUrl,
          attributes: [attribute],
        ),
        galDataSource: MailGalDataSource(
          id: id,
          name: name,
          folderId: folderId,
          isEnabled: isEnabled,
          importOnly: importOnly,
          host: host,
          port: port,
          connectionType: ConnectionType.clearText,
          username: username,
          password: password,
          pollingInterval: pollingInterval,
          emailAddress: emailAddress,
          smtpEnabled: smtpEnabled,
          smtpHost: smtpHost,
          smtpPort: smtpPort,
          smtpConnectionType: ConnectionType.clearText,
          smtpAuthRequired: smtpAuthRequired,
          smtpUsername: smtpUsername,
          smtpPassword: smtpPassword,
          useAddressForForwardReply: useAddressForForwardReply,
          defaultSignature: defaultSignature,
          forwardReplySignature: forwardReplySignature,
          fromDisplay: fromDisplay,
          replyToAddress: replyToAddress,
          replyToDisplay: replyToDisplay,
          importClass: importClass,
          failingSince: failingSince,
          lastError: lastError,
          refreshToken: refreshToken,
          refreshTokenUrl: refreshTokenUrl,
          attributes: [attribute],
        ),
        calDataSource: MailCalDataSource(
          id: id,
          name: name,
          folderId: folderId,
          isEnabled: isEnabled,
          importOnly: importOnly,
          host: host,
          port: port,
          connectionType: ConnectionType.clearText,
          username: username,
          password: password,
          pollingInterval: pollingInterval,
          emailAddress: emailAddress,
          smtpEnabled: smtpEnabled,
          smtpHost: smtpHost,
          smtpPort: smtpPort,
          smtpConnectionType: ConnectionType.clearText,
          smtpAuthRequired: smtpAuthRequired,
          smtpUsername: smtpUsername,
          smtpPassword: smtpPassword,
          useAddressForForwardReply: useAddressForForwardReply,
          defaultSignature: defaultSignature,
          forwardReplySignature: forwardReplySignature,
          fromDisplay: fromDisplay,
          replyToAddress: replyToAddress,
          replyToDisplay: replyToDisplay,
          importClass: importClass,
          failingSince: failingSince,
          lastError: lastError,
          refreshToken: refreshToken,
          refreshTokenUrl: refreshTokenUrl,
          attributes: [attribute],
        ),
        unknownDataSource: MailUnknownDataSource(
          id: id,
          name: name,
          folderId: folderId,
          isEnabled: isEnabled,
          importOnly: importOnly,
          host: host,
          port: port,
          connectionType: ConnectionType.clearText,
          username: username,
          password: password,
          pollingInterval: pollingInterval,
          emailAddress: emailAddress,
          smtpEnabled: smtpEnabled,
          smtpHost: smtpHost,
          smtpPort: smtpPort,
          smtpConnectionType: ConnectionType.clearText,
          smtpAuthRequired: smtpAuthRequired,
          smtpUsername: smtpUsername,
          smtpPassword: smtpPassword,
          useAddressForForwardReply: useAddressForForwardReply,
          defaultSignature: defaultSignature,
          forwardReplySignature: forwardReplySignature,
          fromDisplay: fromDisplay,
          replyToAddress: replyToAddress,
          replyToDisplay: replyToDisplay,
          importClass: importClass,
          failingSince: failingSince,
          lastError: lastError,
          refreshToken: refreshToken,
          refreshTokenUrl: refreshTokenUrl,
          attributes: [attribute],
        ),
      );
      expect(request.getEnvelope().toMap(), {
        'Body': {
          'TestDataSourceRequest': {
            '_jsns': 'urn:zimbraMail',
            'imap': {
              'id': id,
              'name': name,
              'l': folderId,
              'isEnabled': isEnabled,
              'importOnly': importOnly,
              'host': host,
              'port': port,
              'connectionType': ConnectionType.clearText.name,
              'username': username,
              'password': password,
              'pollingInterval': pollingInterval,
              'emailAddress': emailAddress,
              'smtpEnabled': smtpEnabled,
              'smtpHost': smtpHost,
              'smtpPort': smtpPort,
              'smtpConnectionType': ConnectionType.clearText.name,
              'smtpAuthRequired': smtpAuthRequired,
              'smtpUsername': smtpUsername,
              'smtpPassword': smtpPassword,
              'useAddressForForwardReply': useAddressForForwardReply,
              'defaultSignature': defaultSignature,
              'forwardReplySignature': forwardReplySignature,
              'fromDisplay': fromDisplay,
              'replyToAddress': replyToAddress,
              'replyToDisplay': replyToDisplay,
              'importClass': importClass,
              'failingSince': failingSince,
              'lastError': {'_content': lastError},
              'refreshToken': refreshToken,
              'refreshTokenUrl': refreshTokenUrl,
              'oauthToken': oauthToken,
              'clientId': clientId,
              'clientSecret': clientSecret,
              'test': test,
              'a': [
                {'_content': attribute}
              ],
            },
            'pop3': {
              'id': id,
              'name': name,
              'l': folderId,
              'isEnabled': isEnabled,
              'importOnly': importOnly,
              'host': host,
              'port': port,
              'connectionType': ConnectionType.clearText.name,
              'username': username,
              'password': password,
              'pollingInterval': pollingInterval,
              'emailAddress': emailAddress,
              'smtpEnabled': smtpEnabled,
              'smtpHost': smtpHost,
              'smtpPort': smtpPort,
              'smtpConnectionType': ConnectionType.clearText.name,
              'smtpAuthRequired': smtpAuthRequired,
              'smtpUsername': smtpUsername,
              'smtpPassword': smtpPassword,
              'useAddressForForwardReply': useAddressForForwardReply,
              'defaultSignature': defaultSignature,
              'forwardReplySignature': forwardReplySignature,
              'fromDisplay': fromDisplay,
              'replyToAddress': replyToAddress,
              'replyToDisplay': replyToDisplay,
              'importClass': importClass,
              'failingSince': failingSince,
              'lastError': {'_content': lastError},
              'refreshToken': refreshToken,
              'refreshTokenUrl': refreshTokenUrl,
              'leaveOnServer': leaveOnServer,
              'a': [
                {'_content': attribute}
              ],
            },
            'caldav': {
              'id': id,
              'name': name,
              'l': folderId,
              'isEnabled': isEnabled,
              'importOnly': importOnly,
              'host': host,
              'port': port,
              'connectionType': ConnectionType.clearText.name,
              'username': username,
              'password': password,
              'pollingInterval': pollingInterval,
              'emailAddress': emailAddress,
              'smtpEnabled': smtpEnabled,
              'smtpHost': smtpHost,
              'smtpPort': smtpPort,
              'smtpConnectionType': ConnectionType.clearText.name,
              'smtpAuthRequired': smtpAuthRequired,
              'smtpUsername': smtpUsername,
              'smtpPassword': smtpPassword,
              'useAddressForForwardReply': useAddressForForwardReply,
              'defaultSignature': defaultSignature,
              'forwardReplySignature': forwardReplySignature,
              'fromDisplay': fromDisplay,
              'replyToAddress': replyToAddress,
              'replyToDisplay': replyToDisplay,
              'importClass': importClass,
              'failingSince': failingSince,
              'lastError': {'_content': lastError},
              'refreshToken': refreshToken,
              'refreshTokenUrl': refreshTokenUrl,
              'a': [
                {'_content': attribute}
              ],
            },
            'yab': {
              'id': id,
              'name': name,
              'l': folderId,
              'isEnabled': isEnabled,
              'importOnly': importOnly,
              'host': host,
              'port': port,
              'connectionType': ConnectionType.clearText.name,
              'username': username,
              'password': password,
              'pollingInterval': pollingInterval,
              'emailAddress': emailAddress,
              'smtpEnabled': smtpEnabled,
              'smtpHost': smtpHost,
              'smtpPort': smtpPort,
              'smtpConnectionType': ConnectionType.clearText.name,
              'smtpAuthRequired': smtpAuthRequired,
              'smtpUsername': smtpUsername,
              'smtpPassword': smtpPassword,
              'useAddressForForwardReply': useAddressForForwardReply,
              'defaultSignature': defaultSignature,
              'forwardReplySignature': forwardReplySignature,
              'fromDisplay': fromDisplay,
              'replyToAddress': replyToAddress,
              'replyToDisplay': replyToDisplay,
              'importClass': importClass,
              'failingSince': failingSince,
              'lastError': {'_content': lastError},
              'refreshToken': refreshToken,
              'refreshTokenUrl': refreshTokenUrl,
              'a': [
                {'_content': attribute}
              ],
            },
            'rss': {
              'id': id,
              'name': name,
              'l': folderId,
              'isEnabled': isEnabled,
              'importOnly': importOnly,
              'host': host,
              'port': port,
              'connectionType': ConnectionType.clearText.name,
              'username': username,
              'password': password,
              'pollingInterval': pollingInterval,
              'emailAddress': emailAddress,
              'smtpEnabled': smtpEnabled,
              'smtpHost': smtpHost,
              'smtpPort': smtpPort,
              'smtpConnectionType': ConnectionType.clearText.name,
              'smtpAuthRequired': smtpAuthRequired,
              'smtpUsername': smtpUsername,
              'smtpPassword': smtpPassword,
              'useAddressForForwardReply': useAddressForForwardReply,
              'defaultSignature': defaultSignature,
              'forwardReplySignature': forwardReplySignature,
              'fromDisplay': fromDisplay,
              'replyToAddress': replyToAddress,
              'replyToDisplay': replyToDisplay,
              'importClass': importClass,
              'failingSince': failingSince,
              'lastError': {'_content': lastError},
              'refreshToken': refreshToken,
              'refreshTokenUrl': refreshTokenUrl,
              'a': [
                {'_content': attribute}
              ],
            },
            'gal': {
              'id': id,
              'name': name,
              'l': folderId,
              'isEnabled': isEnabled,
              'importOnly': importOnly,
              'host': host,
              'port': port,
              'connectionType': ConnectionType.clearText.name,
              'username': username,
              'password': password,
              'pollingInterval': pollingInterval,
              'emailAddress': emailAddress,
              'smtpEnabled': smtpEnabled,
              'smtpHost': smtpHost,
              'smtpPort': smtpPort,
              'smtpConnectionType': ConnectionType.clearText.name,
              'smtpAuthRequired': smtpAuthRequired,
              'smtpUsername': smtpUsername,
              'smtpPassword': smtpPassword,
              'useAddressForForwardReply': useAddressForForwardReply,
              'defaultSignature': defaultSignature,
              'forwardReplySignature': forwardReplySignature,
              'fromDisplay': fromDisplay,
              'replyToAddress': replyToAddress,
              'replyToDisplay': replyToDisplay,
              'importClass': importClass,
              'failingSince': failingSince,
              'lastError': {'_content': lastError},
              'refreshToken': refreshToken,
              'refreshTokenUrl': refreshTokenUrl,
              'a': [
                {'_content': attribute}
              ],
            },
            'cal': {
              'id': id,
              'name': name,
              'l': folderId,
              'isEnabled': isEnabled,
              'importOnly': importOnly,
              'host': host,
              'port': port,
              'connectionType': ConnectionType.clearText.name,
              'username': username,
              'password': password,
              'pollingInterval': pollingInterval,
              'emailAddress': emailAddress,
              'smtpEnabled': smtpEnabled,
              'smtpHost': smtpHost,
              'smtpPort': smtpPort,
              'smtpConnectionType': ConnectionType.clearText.name,
              'smtpAuthRequired': smtpAuthRequired,
              'smtpUsername': smtpUsername,
              'smtpPassword': smtpPassword,
              'useAddressForForwardReply': useAddressForForwardReply,
              'defaultSignature': defaultSignature,
              'forwardReplySignature': forwardReplySignature,
              'fromDisplay': fromDisplay,
              'replyToAddress': replyToAddress,
              'replyToDisplay': replyToDisplay,
              'importClass': importClass,
              'failingSince': failingSince,
              'lastError': {'_content': lastError},
              'refreshToken': refreshToken,
              'refreshTokenUrl': refreshTokenUrl,
              'a': [
                {'_content': attribute}
              ],
            },
            'unknown': {
              'id': id,
              'name': name,
              'l': folderId,
              'isEnabled': isEnabled,
              'importOnly': importOnly,
              'host': host,
              'port': port,
              'connectionType': ConnectionType.clearText.name,
              'username': username,
              'password': password,
              'pollingInterval': pollingInterval,
              'emailAddress': emailAddress,
              'smtpEnabled': smtpEnabled,
              'smtpHost': smtpHost,
              'smtpPort': smtpPort,
              'smtpConnectionType': ConnectionType.clearText.name,
              'smtpAuthRequired': smtpAuthRequired,
              'smtpUsername': smtpUsername,
              'smtpPassword': smtpPassword,
              'useAddressForForwardReply': useAddressForForwardReply,
              'defaultSignature': defaultSignature,
              'forwardReplySignature': forwardReplySignature,
              'fromDisplay': fromDisplay,
              'replyToAddress': replyToAddress,
              'replyToDisplay': replyToDisplay,
              'importClass': importClass,
              'failingSince': failingSince,
              'lastError': {'_content': lastError},
              'refreshToken': refreshToken,
              'refreshTokenUrl': refreshTokenUrl,
              'a': [
                {'_content': attribute}
              ],
            },
          }
        },
      });
    }));

    test('Test data source response', (() {
      final success = faker.randomGenerator.integer(100);
      final error = faker.lorem.word();
      final data = {
        'Body': {
          'TestDataSourceResponse': {
            '_jsns': 'urn:zimbraMail',
            'imap': [
              {
                'success': success,
                'error': error,
              }
            ],
            'pop3': [
              {
                'success': success,
                'error': error,
              }
            ],
            'caldav': [
              {
                'success': success,
                'error': error,
              }
            ],
            'yab': [
              {
                'success': success,
                'error': error,
              }
            ],
            'rss': [
              {
                'success': success,
                'error': error,
              }
            ],
            'gal': [
              {
                'success': success,
                'error': error,
              }
            ],
            'cal': [
              {
                'success': success,
                'error': error,
              }
            ],
            'unknown': [
              {
                'success': success,
                'error': error,
              }
            ],
          }
        }
      };
      final envelope = TestDataSourceEnvelope.fromMap(data);
      final response = envelope.body.response as TestDataSourceResponse;

      final imap = response.imapDataSources.first;
      expect(imap.success, success);
      expect(imap.error, error);

      final pop3 = response.pop3DataSources.first;
      expect(pop3.success, success);
      expect(pop3.error, error);

      final caldav = response.caldavDataSources.first;
      expect(caldav.success, success);
      expect(caldav.error, error);

      final yab = response.yabDataSources.first;
      expect(yab.success, success);
      expect(yab.error, error);

      final rss = response.rssDataSources.first;
      expect(rss.success, success);
      expect(rss.error, error);

      final gal = response.galDataSources.first;
      expect(gal.success, success);
      expect(gal.error, error);

      final cal = response.calDataSources.first;
      expect(cal.success, success);
      expect(cal.error, error);

      final unknown = response.unknownDataSources.first;
      expect(unknown.success, success);
      expect(unknown.error, error);
    }));
  }));
}
