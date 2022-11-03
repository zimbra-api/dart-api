import 'package:faker/faker.dart';
import 'package:test/test.dart';
import 'package:zimbra_api/src/common/enum/connection_type.dart';
import 'package:zimbra_api/src/mail/message/get_data_sources_envelope.dart';
import 'package:zimbra_api/src/mail/message/get_data_sources_request.dart';

void main() {
  final faker = Faker();

  group('Get data sources tests', (() {
    test('Get data sources request', (() {
      final request = GetDataSourcesRequest();
      expect(request.getEnvelope().toMap(), {
        'Body': {
          'GetDataSourcesRequest': {
            '_jsns': 'urn:zimbraMail',
          }
        },
      });
    }));

    test('Get data sources response', (() {
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

      final data = {
        'Body': {
          'GetDataSourcesResponse': {
            '_jsns': 'urn:zimbraMail',
            'imap': [
              {
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
              }
            ],
            'pop3': [
              {
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
              }
            ],
            'caldav': [
              {
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
              }
            ],
            'yab': [
              {
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
              }
            ],
            'rss': [
              {
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
              }
            ],
            'gal': [
              {
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
              }
            ],
            'cal': [
              {
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
              }
            ],
            'unknown': [
              {
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
              }
            ],
          }
        }
      };
      final envelope = GetDataSourcesEnvelope.fromMap(data);
      final response = envelope.getDataSourcesBody.getDataSourcesResponse!;

      final imap = response.imapDataSources.first;
      expect(imap.id, id);
      expect(imap.name, name);
      expect(imap.folderId, folderId);
      expect(imap.isEnabled, isEnabled);
      expect(imap.importOnly, importOnly);
      expect(imap.host, host);
      expect(imap.port, port);
      expect(imap.connectionType, ConnectionType.clearText);
      expect(imap.username, username);
      expect(imap.password, password);
      expect(imap.pollingInterval, pollingInterval);
      expect(imap.emailAddress, emailAddress);
      expect(imap.smtpEnabled, smtpEnabled);
      expect(imap.smtpHost, smtpHost);
      expect(imap.smtpPort, smtpPort);
      expect(imap.smtpConnectionType, ConnectionType.clearText);
      expect(imap.smtpAuthRequired, smtpAuthRequired);
      expect(imap.smtpUsername, smtpUsername);
      expect(imap.smtpPassword, smtpPassword);
      expect(imap.useAddressForForwardReply, useAddressForForwardReply);
      expect(imap.defaultSignature, defaultSignature);
      expect(imap.forwardReplySignature, forwardReplySignature);
      expect(imap.fromDisplay, fromDisplay);
      expect(imap.replyToAddress, replyToAddress);
      expect(imap.replyToDisplay, replyToDisplay);
      expect(imap.importClass, importClass);
      expect(imap.failingSince, failingSince);
      expect(imap.lastError, lastError);
      expect(imap.refreshToken, refreshToken);
      expect(imap.refreshTokenUrl, refreshTokenUrl);
      expect(imap.oauthToken, oauthToken);
      expect(imap.clientId, clientId);
      expect(imap.clientSecret, clientSecret);
      expect(imap.test, test);
      expect(imap.attributes.first, attribute);

      final pop3 = response.pop3DataSources.first;
      expect(pop3.id, id);
      expect(pop3.name, name);
      expect(pop3.folderId, folderId);
      expect(pop3.isEnabled, isEnabled);
      expect(pop3.importOnly, importOnly);
      expect(pop3.host, host);
      expect(pop3.port, port);
      expect(pop3.connectionType, ConnectionType.clearText);
      expect(pop3.username, username);
      expect(pop3.password, password);
      expect(pop3.pollingInterval, pollingInterval);
      expect(pop3.emailAddress, emailAddress);
      expect(pop3.smtpEnabled, smtpEnabled);
      expect(pop3.smtpHost, smtpHost);
      expect(pop3.smtpPort, smtpPort);
      expect(pop3.smtpConnectionType, ConnectionType.clearText);
      expect(pop3.smtpAuthRequired, smtpAuthRequired);
      expect(pop3.smtpUsername, smtpUsername);
      expect(pop3.smtpPassword, smtpPassword);
      expect(pop3.useAddressForForwardReply, useAddressForForwardReply);
      expect(pop3.defaultSignature, defaultSignature);
      expect(pop3.forwardReplySignature, forwardReplySignature);
      expect(pop3.fromDisplay, fromDisplay);
      expect(pop3.replyToAddress, replyToAddress);
      expect(pop3.replyToDisplay, replyToDisplay);
      expect(pop3.importClass, importClass);
      expect(pop3.failingSince, failingSince);
      expect(pop3.lastError, lastError);
      expect(pop3.refreshToken, refreshToken);
      expect(pop3.refreshTokenUrl, refreshTokenUrl);
      expect(pop3.leaveOnServer, leaveOnServer);
      expect(pop3.attributes.first, attribute);

      final caldav = response.caldavDataSources.first;
      expect(caldav.id, id);
      expect(caldav.name, name);
      expect(caldav.folderId, folderId);
      expect(caldav.isEnabled, isEnabled);
      expect(caldav.importOnly, importOnly);
      expect(caldav.host, host);
      expect(caldav.port, port);
      expect(caldav.connectionType, ConnectionType.clearText);
      expect(caldav.username, username);
      expect(caldav.password, password);
      expect(caldav.pollingInterval, pollingInterval);
      expect(caldav.emailAddress, emailAddress);
      expect(caldav.smtpEnabled, smtpEnabled);
      expect(caldav.smtpHost, smtpHost);
      expect(caldav.smtpPort, smtpPort);
      expect(caldav.smtpConnectionType, ConnectionType.clearText);
      expect(caldav.smtpAuthRequired, smtpAuthRequired);
      expect(caldav.smtpUsername, smtpUsername);
      expect(caldav.smtpPassword, smtpPassword);
      expect(caldav.useAddressForForwardReply, useAddressForForwardReply);
      expect(caldav.defaultSignature, defaultSignature);
      expect(caldav.forwardReplySignature, forwardReplySignature);
      expect(caldav.fromDisplay, fromDisplay);
      expect(caldav.replyToAddress, replyToAddress);
      expect(caldav.replyToDisplay, replyToDisplay);
      expect(caldav.importClass, importClass);
      expect(caldav.failingSince, failingSince);
      expect(caldav.lastError, lastError);
      expect(caldav.refreshToken, refreshToken);
      expect(caldav.refreshTokenUrl, refreshTokenUrl);
      expect(caldav.attributes.first, attribute);

      final yab = response.yabDataSources.first;
      expect(yab.id, id);
      expect(yab.name, name);
      expect(yab.folderId, folderId);
      expect(yab.isEnabled, isEnabled);
      expect(yab.importOnly, importOnly);
      expect(yab.host, host);
      expect(yab.port, port);
      expect(yab.connectionType, ConnectionType.clearText);
      expect(yab.username, username);
      expect(yab.password, password);
      expect(yab.pollingInterval, pollingInterval);
      expect(yab.emailAddress, emailAddress);
      expect(yab.smtpEnabled, smtpEnabled);
      expect(yab.smtpHost, smtpHost);
      expect(yab.smtpPort, smtpPort);
      expect(yab.smtpConnectionType, ConnectionType.clearText);
      expect(yab.smtpAuthRequired, smtpAuthRequired);
      expect(yab.smtpUsername, smtpUsername);
      expect(yab.smtpPassword, smtpPassword);
      expect(yab.useAddressForForwardReply, useAddressForForwardReply);
      expect(yab.defaultSignature, defaultSignature);
      expect(yab.forwardReplySignature, forwardReplySignature);
      expect(yab.fromDisplay, fromDisplay);
      expect(yab.replyToAddress, replyToAddress);
      expect(yab.replyToDisplay, replyToDisplay);
      expect(yab.importClass, importClass);
      expect(yab.failingSince, failingSince);
      expect(yab.lastError, lastError);
      expect(yab.refreshToken, refreshToken);
      expect(yab.refreshTokenUrl, refreshTokenUrl);
      expect(yab.attributes.first, attribute);

      final rss = response.rssDataSources.first;
      expect(rss.id, id);
      expect(rss.name, name);
      expect(rss.folderId, folderId);
      expect(rss.isEnabled, isEnabled);
      expect(rss.importOnly, importOnly);
      expect(rss.host, host);
      expect(rss.port, port);
      expect(rss.connectionType, ConnectionType.clearText);
      expect(rss.username, username);
      expect(rss.password, password);
      expect(rss.pollingInterval, pollingInterval);
      expect(rss.emailAddress, emailAddress);
      expect(rss.smtpEnabled, smtpEnabled);
      expect(rss.smtpHost, smtpHost);
      expect(rss.smtpPort, smtpPort);
      expect(rss.smtpConnectionType, ConnectionType.clearText);
      expect(rss.smtpAuthRequired, smtpAuthRequired);
      expect(rss.smtpUsername, smtpUsername);
      expect(rss.smtpPassword, smtpPassword);
      expect(rss.useAddressForForwardReply, useAddressForForwardReply);
      expect(rss.defaultSignature, defaultSignature);
      expect(rss.forwardReplySignature, forwardReplySignature);
      expect(rss.fromDisplay, fromDisplay);
      expect(rss.replyToAddress, replyToAddress);
      expect(rss.replyToDisplay, replyToDisplay);
      expect(rss.importClass, importClass);
      expect(rss.failingSince, failingSince);
      expect(rss.lastError, lastError);
      expect(rss.refreshToken, refreshToken);
      expect(rss.refreshTokenUrl, refreshTokenUrl);
      expect(rss.attributes.first, attribute);

      final gal = response.galDataSources.first;
      expect(gal.id, id);
      expect(gal.name, name);
      expect(gal.folderId, folderId);
      expect(gal.isEnabled, isEnabled);
      expect(gal.importOnly, importOnly);
      expect(gal.host, host);
      expect(gal.port, port);
      expect(gal.connectionType, ConnectionType.clearText);
      expect(gal.username, username);
      expect(gal.password, password);
      expect(gal.pollingInterval, pollingInterval);
      expect(gal.emailAddress, emailAddress);
      expect(gal.smtpEnabled, smtpEnabled);
      expect(gal.smtpHost, smtpHost);
      expect(gal.smtpPort, smtpPort);
      expect(gal.smtpConnectionType, ConnectionType.clearText);
      expect(gal.smtpAuthRequired, smtpAuthRequired);
      expect(gal.smtpUsername, smtpUsername);
      expect(gal.smtpPassword, smtpPassword);
      expect(gal.useAddressForForwardReply, useAddressForForwardReply);
      expect(gal.defaultSignature, defaultSignature);
      expect(gal.forwardReplySignature, forwardReplySignature);
      expect(gal.fromDisplay, fromDisplay);
      expect(gal.replyToAddress, replyToAddress);
      expect(gal.replyToDisplay, replyToDisplay);
      expect(gal.importClass, importClass);
      expect(gal.failingSince, failingSince);
      expect(gal.lastError, lastError);
      expect(gal.refreshToken, refreshToken);
      expect(gal.refreshTokenUrl, refreshTokenUrl);
      expect(gal.attributes.first, attribute);

      final cal = response.calDataSources.first;
      expect(cal.id, id);
      expect(cal.name, name);
      expect(cal.folderId, folderId);
      expect(cal.isEnabled, isEnabled);
      expect(cal.importOnly, importOnly);
      expect(cal.host, host);
      expect(cal.port, port);
      expect(cal.connectionType, ConnectionType.clearText);
      expect(cal.username, username);
      expect(cal.password, password);
      expect(cal.pollingInterval, pollingInterval);
      expect(cal.emailAddress, emailAddress);
      expect(cal.smtpEnabled, smtpEnabled);
      expect(cal.smtpHost, smtpHost);
      expect(cal.smtpPort, smtpPort);
      expect(cal.smtpConnectionType, ConnectionType.clearText);
      expect(cal.smtpAuthRequired, smtpAuthRequired);
      expect(cal.smtpUsername, smtpUsername);
      expect(cal.smtpPassword, smtpPassword);
      expect(cal.useAddressForForwardReply, useAddressForForwardReply);
      expect(cal.defaultSignature, defaultSignature);
      expect(cal.forwardReplySignature, forwardReplySignature);
      expect(cal.fromDisplay, fromDisplay);
      expect(cal.replyToAddress, replyToAddress);
      expect(cal.replyToDisplay, replyToDisplay);
      expect(cal.importClass, importClass);
      expect(cal.failingSince, failingSince);
      expect(cal.lastError, lastError);
      expect(cal.refreshToken, refreshToken);
      expect(cal.refreshTokenUrl, refreshTokenUrl);
      expect(cal.attributes.first, attribute);

      final unknown = response.unknownDataSources.first;
      expect(unknown.id, id);
      expect(unknown.name, name);
      expect(unknown.folderId, folderId);
      expect(unknown.isEnabled, isEnabled);
      expect(unknown.importOnly, importOnly);
      expect(unknown.host, host);
      expect(unknown.port, port);
      expect(unknown.connectionType, ConnectionType.clearText);
      expect(unknown.username, username);
      expect(unknown.password, password);
      expect(unknown.pollingInterval, pollingInterval);
      expect(unknown.emailAddress, emailAddress);
      expect(unknown.smtpEnabled, smtpEnabled);
      expect(unknown.smtpHost, smtpHost);
      expect(unknown.smtpPort, smtpPort);
      expect(unknown.smtpConnectionType, ConnectionType.clearText);
      expect(unknown.smtpAuthRequired, smtpAuthRequired);
      expect(unknown.smtpUsername, smtpUsername);
      expect(unknown.smtpPassword, smtpPassword);
      expect(unknown.useAddressForForwardReply, useAddressForForwardReply);
      expect(unknown.defaultSignature, defaultSignature);
      expect(unknown.forwardReplySignature, forwardReplySignature);
      expect(unknown.fromDisplay, fromDisplay);
      expect(unknown.replyToAddress, replyToAddress);
      expect(unknown.replyToDisplay, replyToDisplay);
      expect(unknown.importClass, importClass);
      expect(unknown.failingSince, failingSince);
      expect(unknown.lastError, lastError);
      expect(unknown.refreshToken, refreshToken);
      expect(unknown.refreshTokenUrl, refreshTokenUrl);
      expect(unknown.attributes.first, attribute);
    }));
  }));
}
