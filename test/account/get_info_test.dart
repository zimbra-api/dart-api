import 'package:faker/faker.dart';
import 'package:test/test.dart';
import 'package:zimbra_api/src/account/message/get_info_envelope.dart';
import 'package:zimbra_api/src/account/message/get_info_request.dart';
import 'package:zimbra_api/src/common/enum/connection_type.dart';
import 'package:zimbra_api/src/common/enum/content_type.dart';
import 'package:zimbra_api/src/common/enum/target_type.dart';
import 'package:zimbra_api/src/common/enum/zimlet_presence.dart';

void main() {
  final faker = Faker();

  group('Get info tests', (() {
    test('Get info request', (() {
      final sections = faker.lorem.words(3).join(',');
      final rights = faker.lorem.words(3).join(',');
      final request = GetInfoRequest(sections: sections, rights: rights);

      expect(request.getEnvelope().toJson(), {
        'Body': {
          'GetInfoRequest': {
            '_jsns': 'urn:zimbraAccount',
            'sections': sections,
            'rights': rights,
          }
        },
      });
    }));

    test('Get info response', (() {
      final attachmentSizeLimit = faker.randomGenerator.integer(100);
      final documentSizeLimit = faker.randomGenerator.integer(100);
      final version = faker.lorem.word();
      final accountId = faker.guid.guid();
      final profileImageId = faker.randomGenerator.integer(100);
      final accountName = faker.internet.email();
      final crumb = faker.lorem.word();
      final lifetime = faker.randomGenerator.integer(100);
      final adminDelegated = faker.randomGenerator.boolean();
      final restUrl = faker.internet.httpsUrl();
      final quotaUsed = faker.randomGenerator.integer(100);
      final previousSessionTime = faker.randomGenerator.integer(100);
      final lastWriteAccessTime = faker.randomGenerator.integer(100);
      final recentMessageCount = faker.randomGenerator.integer(100);
      final soapURL = faker.internet.httpsUrl();
      final publicURL = faker.internet.httpsUrl();
      final changePasswordURL = faker.internet.httpsUrl();
      final adminURL = faker.internet.httpsUrl();
      final boshURL = faker.internet.httpsUrl();
      final isTrackingIMAP = faker.randomGenerator.boolean();

      final email = faker.internet.email();
      final id = faker.guid.guid();
      final name = faker.lorem.word();
      final value = faker.lorem.word();
      final modified = faker.randomGenerator.integer(100);
      final permDenied = faker.randomGenerator.boolean();

      final zimletBaseUrl = faker.internet.httpsUrl();
      final zimletPriority = faker.randomGenerator.integer(100);
      final description = faker.lorem.word();
      final extension = faker.lorem.word();
      final target = faker.lorem.word();
      final label = faker.lorem.word();
      final hasKeyword = faker.lorem.word();
      final extensionClass = faker.lorem.word();
      final regex = faker.lorem.word();

      final zimlet = faker.lorem.word();
      final cid = faker.guid.guid();
      final isVisible = faker.randomGenerator.boolean();
      final isActive = faker.randomGenerator.boolean();
      final right = faker.lorem.word();
      final displayName = faker.person.name();
      final addr = faker.internet.email();

      final folderId = faker.guid.guid();
      final enabled = faker.randomGenerator.boolean();
      final importOnly = faker.randomGenerator.boolean();
      final host = faker.internet.ipv4Address();
      final port = faker.randomGenerator.integer(100);
      final username = faker.internet.userName();
      final password = faker.internet.password();
      final pollingInterval = faker.lorem.word();
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
      final dataSource = {
        'id': id,
        'name': name,
        'l': folderId,
        'isEnabled': enabled,
        'importOnly': importOnly,
        'host': host,
        'port': port,
        'connectionType': ConnectionType.clearText.name,
        'username': username,
        'password': password,
        'pollingInterval': pollingInterval,
        'emailAddress': email,
        'useAddressForForwardReply': useAddressForForwardReply,
        'defaultSignature': defaultSignature,
        'forwardReplySignature': forwardReplySignature,
        'fromDisplay': fromDisplay,
        'replyToAddress': replyToAddress,
        'replyToDisplay': replyToDisplay,
        'importClass': importClass,
        'failingSince': failingSince,
        'lastError': {'_content': lastError},
        'a': [
          {'_content': attribute}
        ],
        'refreshToken': refreshToken,
        'refreshTokenUrl': refreshTokenUrl,
      };
      final pop3DataSource = Map<String, dynamic>.from(dataSource);
      pop3DataSource['leaveOnServer'] = leaveOnServer;

      final json = {
        'Body': {
          'GetInfoResponse': {
            '_jsns': 'urn:zimbraAccount',
            'attSizeLimit': attachmentSizeLimit,
            'docSizeLimit': documentSizeLimit,
            'version': {'_content': version},
            'id': {'_content': accountId},
            'profileImageId': {'_content': profileImageId},
            'name': {'_content': accountName},
            'crumb': {'_content': crumb},
            'lifetime': {'_content': lifetime},
            'adminDelegated': {'_content': adminDelegated},
            'rest': {'_content': restUrl},
            'used': {'_content': quotaUsed},
            'prevSession': {'_content': previousSessionTime},
            'accessed': {'_content': lastWriteAccessTime},
            'recent': {'_content': recentMessageCount},
            'cos': {
              'id': id,
              'name': name,
            },
            'prefs': {
              'pref': [
                {
                  'name': name,
                  'modified': modified,
                  '_content': value,
                }
              ]
            },
            'attrs': {
              'attr': [
                {
                  'name': name,
                  'pd': permDenied,
                  '_content': value,
                }
              ]
            },
            'zimlets': {
              'zimlet': [
                {
                  'zimletContext': {
                    'baseUrl': zimletBaseUrl,
                    'priority': zimletPriority,
                    'presence': ZimletPresence.enabled.name,
                  },
                  'zimlet': {
                    'name': name,
                    'version': version,
                    'description': description,
                    'extension': extension,
                    'target': target,
                    'label': label,
                    'serverExtension': {
                      'hasKeyword': hasKeyword,
                      'extensionClass': extensionClass,
                      'regex': regex,
                    },
                    'include': {
                      '_content': value,
                    },
                    'includeCSS': {
                      '_content': value,
                    },
                    'zimletTarget': {
                      '_content': value,
                    },
                  },
                  'zimletConfig': {
                    'name': name,
                    'version': version,
                    'description': description,
                    'extension': extension,
                    'target': target,
                    'label': label,
                    'global': {
                      'property': [
                        {
                          'name': name,
                          '_content': value,
                        }
                      ],
                    },
                    'host': {
                      'name': name,
                      'property': [
                        {
                          'name': name,
                          '_content': value,
                        }
                      ],
                    },
                  },
                }
              ],
            },
            'props': {
              'prop': [
                {
                  'zimlet': zimlet,
                  'name': name,
                  '_content': value,
                }
              ],
            },
            'identities': {
              'identity': [
                {
                  'name': email,
                  'id': id,
                  'a': [
                    {
                      'name': name,
                      'pd': permDenied,
                      '_content': value,
                    },
                  ],
                }
              ],
            },
            'signatures': {
              'signature': [
                {
                  'name': name,
                  'id': id,
                  'cid': cid,
                  'content': [
                    {
                      'type': ContentType.textHtml.name,
                      '_content': value,
                    },
                  ],
                }
              ],
            },
            'dataSources': {
              'imap': [dataSource],
              'pop3': [pop3DataSource],
              'caldav': [dataSource],
              'yab': [dataSource],
              'rss': [dataSource],
              'gal': [dataSource],
              'cal': [dataSource],
              'unknown': [dataSource],
            },
            'childAccounts': {
              'childAccount': [
                {
                  'id': id,
                  'name': name,
                  'visible': isVisible,
                  'active': isActive,
                  'attrs': {
                    'attr': [
                      {
                        'name': name,
                        'pd': permDenied,
                        '_content': value,
                      }
                    ]
                  },
                }
              ],
            },
            'rights': {
              'targets': [
                {
                  'right': right,
                  'target': [
                    {
                      'type': TargetType.account.name,
                      'id': id,
                      'name': name,
                      'd': displayName,
                      'email': [
                        {'addr': addr}
                      ],
                    }
                  ],
                }
              ],
            },
            'soapURL': {'_content': soapURL},
            'publicURL': {'_content': publicURL},
            'changePasswordURL': {'_content': changePasswordURL},
            'adminURL': {'_content': adminURL},
            'boshURL': {'_content': boshURL},
            'isTrackingIMAP': {'_content': isTrackingIMAP},
          }
        }
      };
      final envelope = GetInfoEnvelope.fromJson(json);
      final response = envelope.getInfoBody.getInfoResponse;

      expect(response!.attachmentSizeLimit, attachmentSizeLimit);
      expect(response.documentSizeLimit, documentSizeLimit);
      expect(response.version, version);
      expect(response.accountId, accountId);
      expect(response.profileImageId, profileImageId);
      expect(response.accountName, accountName);
      expect(response.crumb, crumb);
      expect(response.lifetime, lifetime);
      expect(response.adminDelegated, adminDelegated);
      expect(response.restUrl, restUrl);
      expect(response.quotaUsed, quotaUsed);
      expect(response.previousSessionTime, previousSessionTime);
      expect(response.lastWriteAccessTime, lastWriteAccessTime);
      expect(response.recentMessageCount, recentMessageCount);
      expect(response.soapURL, soapURL);
      expect(response.publicURL, publicURL);
      expect(response.changePasswordURL, changePasswordURL);
      expect(response.adminURL, adminURL);
      expect(response.boshURL, boshURL);
      expect(response.isTrackingIMAP, isTrackingIMAP);

      expect(response.cos!.id, id);
      expect(response.cos!.name, name);

      final dataSources = response.dataSources;
      final imap = dataSources!.imapDataSources.first;
      final pop3 = dataSources.pop3DataSources.first;
      final caldav = dataSources.caldavDataSources.first;
      final yab = dataSources.yabDataSources.first;
      final rss = dataSources.rssDataSources.first;
      final gal = dataSources.galDataSources.first;
      final cal = dataSources.calDataSources.first;
      final unknown = dataSources.unknownDataSources.first;
      expect(imap.toJson(), dataSource);
      expect(pop3.toJson(), pop3DataSource);
      expect(caldav.toJson(), dataSource);
      expect(yab.toJson(), dataSource);
      expect(rss.toJson(), dataSource);
      expect(gal.toJson(), dataSource);
      expect(cal.toJson(), dataSource);
      expect(unknown.toJson(), dataSource);

      expect(response.prefs.first.name, name);
      expect(response.prefs.first.modified, modified);
      expect(response.prefs.first.value, value);

      expect(response.attrs.first.name, name);
      expect(response.attrs.first.permDenied, permDenied);
      expect(response.attrs.first.value, value);

      final zimletInfo = response.zimlets.first;
      expect(zimletInfo.zimletContext!.zimletBaseUrl, zimletBaseUrl);
      expect(zimletInfo.zimletContext!.zimletPriority, zimletPriority);
      expect(zimletInfo.zimletContext!.zimletPresence, ZimletPresence.enabled);

      expect(zimletInfo.zimlet!.name, name);
      expect(zimletInfo.zimlet!.version, version);
      expect(zimletInfo.zimlet!.description, description);
      expect(zimletInfo.zimlet!.target, target);
      expect(zimletInfo.zimlet!.label, label);
      expect(zimletInfo.zimlet!.serverExtension!.hasKeyword, hasKeyword);
      expect(zimletInfo.zimlet!.serverExtension!.extensionClass, extensionClass);
      expect(zimletInfo.zimlet!.serverExtension!.regex, regex);
      expect(zimletInfo.zimlet!.include!.value, value);
      expect(zimletInfo.zimlet!.includeCSS!.value, value);
      expect(zimletInfo.zimlet!.zimletTarget!.value, value);

      expect(zimletInfo.zimletConfig!.name, name);
      expect(zimletInfo.zimletConfig!.version, version);
      expect(zimletInfo.zimletConfig!.description, description);
      expect(zimletInfo.zimletConfig!.extension, extension);
      expect(zimletInfo.zimletConfig!.target, target);
      expect(zimletInfo.zimletConfig!.label, label);
      expect(zimletInfo.zimletConfig!.global!.properties.first.name, name);
      expect(zimletInfo.zimletConfig!.global!.properties.first.value, value);
      expect(zimletInfo.zimletConfig!.host!.name, name);
      expect(zimletInfo.zimletConfig!.host!.properties.first.name, name);
      expect(zimletInfo.zimletConfig!.host!.properties.first.value, value);

      expect(response.props.first.zimlet, zimlet);
      expect(response.props.first.name, name);
      expect(response.props.first.value, value);

      expect(response.identities.first.name, email);
      expect(response.identities.first.id, id);

      final attr = response.identities.first.attrs.first;
      expect(attr.name, name);
      expect(attr.permDenied, permDenied);
      expect(attr.value, value);

      final signature = response.signatures.first;
      expect(signature.name, name);
      expect(signature.id, id);
      expect(signature.cid, cid);

      final content = signature.contents.first;
      expect(content.type, ContentType.textHtml);
      expect(content.value, value);

      final childAccount = response.childAccounts.first;
      expect(childAccount.id, id);
      expect(childAccount.name, name);
      expect(childAccount.isVisible, isVisible);
      expect(childAccount.isActive, isActive);
      expect(childAccount.attrs.first.name, name);
      expect(childAccount.attrs.first.value, value);
      expect(childAccount.attrs.first.permDenied, permDenied);

      final discoveredRight = response.discoveredRights.first;
      expect(discoveredRight.right, right);
      expect(discoveredRight.targets.first.type, TargetType.account);
      expect(discoveredRight.targets.first.id, id);
      expect(discoveredRight.targets.first.name, name);
      expect(discoveredRight.targets.first.displayName, displayName);
      expect(discoveredRight.targets.first.emails.first.addr, addr);
    }));
  }));
}
