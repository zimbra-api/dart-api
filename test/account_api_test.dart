import 'dart:convert';

import 'package:faker/faker.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:test/test.dart';
import 'package:zimbra_api/src/account/message/delete_identity_response.dart';
import 'package:zimbra_api/src/account/message/delete_signature_response.dart';
import 'package:zimbra_api/src/account/message/distribution_list_action_response.dart';
import 'package:zimbra_api/src/account/message/end_session_response.dart';
import 'package:zimbra_api/src/account/message/modify_identity_response.dart';
import 'package:zimbra_api/src/account/message/modify_prefs_response.dart';
import 'package:zimbra_api/src/account/message/modify_properties_response.dart';
import 'package:zimbra_api/src/account/message/modify_signature_response.dart';
import 'package:zimbra_api/src/account/message/modify_white_black_list_response.dart';
import 'package:zimbra_api/src/account/message/reset_password_response.dart';
import 'package:zimbra_api/src/account/message/revoke_oauth_consumer_response.dart';
import 'package:zimbra_api/src/account/type/distribution_list_action.dart';
import 'package:zimbra_api/src/account/type/identity.dart';
import 'package:zimbra_api/src/account/type/name_id.dart';
import 'package:zimbra_api/src/account/type/signature.dart';
import 'package:zimbra_api/src/account_api.dart';
import 'package:zimbra_api/src/common/enum/account_by.dart';
import 'package:zimbra_api/src/common/enum/connection_type.dart';
import 'package:zimbra_api/src/common/enum/content_type.dart';
import 'package:zimbra_api/src/common/enum/distribution_list_by.dart';
import 'package:zimbra_api/src/common/enum/distribution_list_subscribe_status.dart';
import 'package:zimbra_api/src/common/enum/domain_by.dart';
import 'package:zimbra_api/src/common/enum/grantee_type.dart';
import 'package:zimbra_api/src/common/enum/operation.dart';
import 'package:zimbra_api/src/common/enum/target_by.dart';
import 'package:zimbra_api/src/common/enum/target_type.dart';
import 'package:zimbra_api/src/common/enum/zimlet_presence.dart';
import 'package:zimbra_api/src/common/type/account_selector.dart';
import 'package:zimbra_api/src/common/type/distribution_list_selector.dart';
import 'package:zimbra_api/src/common/type/domain_selector.dart';

void main() {
  final faker = Faker();

  group('Account api tests', (() {
    test('auth test', (() async {
      final authToken = faker.guid.guid();
      final lifetime = faker.randomGenerator.integer(100);
      final trustLifetime = faker.randomGenerator.integer(100);
      final sessionId = faker.guid.guid();
      final sessionType = faker.lorem.word();
      final refer = faker.lorem.word();
      final skin = faker.lorem.word();
      final csrfToken = faker.guid.guid();
      final deviceId = faker.guid.guid();
      final trustedToken = faker.guid.guid();
      final zmgProxy = faker.randomGenerator.boolean();
      final twoFactorAuthRequired = faker.randomGenerator.boolean();
      final trustedDevicesEnabled = faker.randomGenerator.boolean();

      final name = faker.lorem.word();
      final value = faker.lorem.word();

      final data = {
        'Body': {
          'AuthResponse': {
            '_jsns': 'urn:zimbraAccount',
            'authToken': [
              {
                '_content': authToken,
              }
            ],
            'lifetime': lifetime,
            'trustLifetime': trustLifetime,
            'session': {
              'id': sessionId,
              'type': sessionType,
            },
            'refer': refer,
            'skin': [
              {
                '_content': skin,
              }
            ],
            'csrfToken': {
              '_content': csrfToken,
            },
            'deviceId': {
              '_content': deviceId,
            },
            'trustedToken': {
              '_content': trustedToken,
            },
            'zmgProxy': zmgProxy,
            'twoFactorAuthRequired': twoFactorAuthRequired,
            'trustedDevicesEnabled': trustedDevicesEnabled,
            'prefs': {
              '_attrs': {
                name: value,
              },
            },
            'attrs': {
              '_attrs': {
                name: value,
              },
            },
          },
        },
      };

      final api = mockApi(data);
      final response = await api.auth();

      expect(response!.authToken, authToken);
      expect(response.lifetime, lifetime);
      expect(response.trustLifetime, trustLifetime);
      expect(response.session!.id, sessionId);
      expect(response.session!.type, sessionType);
      expect(response.refer, refer);
      expect(response.skin, skin);
      expect(response.csrfToken, csrfToken);
      expect(response.deviceId, deviceId);
      expect(response.trustedToken, trustedToken);
      expect(response.zmgProxy, zmgProxy);
      expect(response.twoFactorAuthRequired, twoFactorAuthRequired);
      expect(response.trustedDevicesEnabled, trustedDevicesEnabled);

      expect(response.prefs.isNotEmpty, isTrue);
      expect(response.prefs.first.name, name);
      expect(response.prefs.first.value, value);

      expect(response.attrs.isNotEmpty, isTrue);
      expect(response.attrs.first.name, name);
      expect(response.attrs.first.value, value);
    }));

    test('auto complete gal test', (() async {
      final more = faker.randomGenerator.boolean();
      final tokenizeKey = faker.randomGenerator.boolean();
      final pagingSupported = faker.randomGenerator.boolean();

      final sortField = faker.lorem.word();
      final canExpand = faker.randomGenerator.boolean();
      final id = faker.guid.guid();
      final folder = faker.lorem.word();
      final flags = faker.lorem.word();
      final tags = faker.lorem.word();
      final tagNames = faker.lorem.word();
      final changeDate = faker.date.dateTime().millisecondsSinceEpoch;
      final modifiedSequenceId = faker.randomGenerator.integer(100);
      final date = faker.date.dateTime().millisecondsSinceEpoch;
      final revisionId = faker.randomGenerator.integer(100);
      final fileAs = faker.lorem.word();
      final email = faker.internet.email();
      final email2 = faker.internet.email();
      final email3 = faker.internet.email();
      final type = faker.lorem.word();
      final dlist = faker.lorem.word();
      final reference = faker.lorem.word();
      final tooManyMembers = faker.randomGenerator.boolean();
      final isOwner = faker.randomGenerator.boolean();
      final isMember = faker.randomGenerator.boolean();

      final section = faker.lorem.word();
      final key = faker.lorem.word();
      final value = faker.lorem.word();

      final data = {
        'Body': {
          'AutoCompleteGalResponse': {
            '_jsns': 'urn:zimbraAccount',
            'more': more,
            'tokenizeKey': tokenizeKey,
            'paginationSupported': pagingSupported,
            'cn': [
              {
                'sf': sortField,
                'exp': canExpand,
                'id': id,
                'l': folder,
                'f': flags,
                't': tags,
                'tn': tagNames,
                'md': changeDate,
                'ms': modifiedSequenceId,
                'd': date,
                'rev': revisionId,
                'fileAsStr': fileAs,
                'email': email,
                'email2': email2,
                'email3': email3,
                'type': type,
                'dlist': dlist,
                'ref': reference,
                'tooManyMembers': tooManyMembers,
                'isOwner': isOwner,
                'isMember': isMember,
                'meta': [
                  {
                    'section': section,
                    '_attrs': {
                      key: value,
                    },
                  },
                ],
                '_attrs': {
                  key: value,
                },
                'm': [
                  {
                    'type': type,
                    'value': value,
                  },
                ],
              },
            ],
          },
        },
      };

      final api = mockApi(data);
      final response = await api.autoCompleteGal(faker.lorem.word());
      final contact = response!.contacts.first;

      expect(response.more, more);
      expect(response.tokenizeKey, tokenizeKey);
      expect(response.pagingSupported, pagingSupported);
      expect(response.contacts.isNotEmpty, isTrue);

      expect(contact.sortField, sortField);
      expect(contact.canExpand, canExpand);
      expect(contact.id, id);
      expect(contact.folder, folder);
      expect(contact.flags, flags);
      expect(contact.tags, tags);
      expect(contact.tagNames, tagNames);
      expect(contact.changeDate, changeDate);
      expect(contact.modifiedSequenceId, modifiedSequenceId);
      expect(contact.date, date);
      expect(contact.revisionId, revisionId);
      expect(contact.fileAs, fileAs);
      expect(contact.email, email);
      expect(contact.email2, email2);
      expect(contact.email3, email3);
      expect(contact.type, type);
      expect(contact.dlist, dlist);
      expect(contact.reference, reference);
      expect(contact.tooManyMembers, tooManyMembers);
      expect(contact.isOwner, isOwner);
      expect(contact.isMember, isMember);

      final meta = contact.metadatas.first;
      final kvp = meta.keyValuePairs.first;
      expect(meta.section, section);
      expect(kvp.key, key);
      expect(kvp.value, value);

      final attr = contact.attrs.first;
      expect(attr.key, key);
      expect(attr.value, value);

      final member = contact.contactGroupMembers.first;
      expect(member.type, type);
      expect(member.value, value);
    }));

    test('Change password test', () async {
      final authToken = faker.guid.guid();
      final lifetime = faker.randomGenerator.integer(100);
      final data = {
        'Body': {
          'ChangePasswordResponse': {
            '_jsns': 'urn:zimbraAccount',
            'authToken': [
              {
                '_content': authToken,
              }
            ],
            'lifetime': lifetime,
          },
        },
      };

      final api = mockApi(data);
      final response = await api.changePassword(
        AccountSelector(AccountBy.name, faker.internet.email()),
        faker.internet.password(),
        faker.internet.password(),
      );

      expect(response!.authToken, authToken);
      expect(response.lifetime, lifetime);
    });

    test('Check rights test', (() async {
      final targetKey = faker.guid.guid();
      final allow = faker.randomGenerator.boolean();
      final right = faker.lorem.word();
      final data = {
        'Body': {
          'CheckRightsResponse': {
            '_jsns': 'urn:zimbraAccount',
            'target': [
              {
                'type': TargetType.account.name,
                'by': TargetBy.name.name,
                'key': targetKey,
                'allow': allow,
                'right': [
                  {
                    'allow': allow,
                    '_content': right,
                  },
                ],
              },
            ],
          },
        },
      };

      final api = mockApi(data);
      final response = await api.checkRights();

      final target = response!.targets.first;

      expect(target.targetType, TargetType.account);
      expect(target.targetBy, TargetBy.name);
      expect(target.targetKey, targetKey);
      expect(target.allow, allow);

      final rightInfo = target.rights.first;
      expect(rightInfo.allow, allow);
      expect(rightInfo.right, right);
    }));

    test('Client info test', (() async {
      final key = faker.lorem.word();
      final value = faker.lorem.word();
      final data = {
        'Body': {
          'ClientInfoResponse': {
            '_jsns': 'urn:zimbraAccount',
            '_attrs': {
              key: value,
            },
          },
        },
      };

      final api = mockApi(data);
      final response = await api.clientInfo(DomainSelector(DomainBy.name, faker.internet.domainName()));
      final attr = response!.attrs.first;

      expect(attr.key, key);
      expect(attr.value, value);
    }));

    test('Create distribution list test', (() async {
      final name = faker.internet.email();
      final id = faker.guid.guid();
      final ref = faker.internet.email();
      final displayName = faker.person.name();
      final isDynamic = faker.randomGenerator.boolean();
      final via = faker.internet.email();
      final isOwner = faker.randomGenerator.boolean();
      final isMember = faker.randomGenerator.boolean();
      final key = faker.lorem.word();
      final value = faker.lorem.word();

      final data = {
        'Body': {
          'CreateDistributionListResponse': {
            '_jsns': 'urn:zimbraAccount',
            'dl': {
              'name': name,
              'id': id,
              'ref': ref,
              'd': displayName,
              'dynamic': isDynamic,
              'via': via,
              'isOwner': isOwner,
              'isMember': isMember,
              '_attrs': {
                key: value,
              },
            },
          },
        },
      };

      final api = mockApi(data);
      final response = await api.createDistributionList(faker.internet.email());
      final dl = response!.dl!;

      expect(dl.name, name);
      expect(dl.id, id);
      expect(dl.ref, ref);
      expect(dl.displayName, displayName);
      expect(dl.isDynamic, isDynamic);
      expect(dl.via, via);
      expect(dl.isOwner, isOwner);
      expect(dl.isMember, isMember);

      final attr = dl.attrList.first;
      expect(attr.key, key);
      expect(attr.value, value);
    }));

    test('Create identity test', (() async {
      final email = faker.internet.email();
      final id = faker.guid.guid();
      final name = faker.lorem.word();
      final value = faker.lorem.word();

      final data = {
        'Body': {
          'CreateIdentityResponse': {
            '_jsns': 'urn:zimbraAccount',
            'identity': {
              'name': email,
              'id': id,
              '_attrs': {
                name: value,
              },
            },
          }
        }
      };

      final api = mockApi(data);
      final response = await api.createIdentity(Identity(name: faker.lorem.word()));
      final identity = response!.identity!;

      expect(identity.name, email);
      expect(identity.id, id);

      final attr = identity.attrs.first;
      expect(attr.name, name);
      expect(attr.value, value);
    }));

    test('Create signature test', (() async {
      final name = faker.lorem.word();
      final id = faker.guid.guid();
      final cid = faker.guid.guid();
      final value = faker.lorem.word();

      final data = {
        'Body': {
          'CreateSignatureResponse': {
            '_jsns': 'urn:zimbraAccount',
            'signature': {
              'name': name,
              'id': id,
              'cid': cid,
              'content': [
                {
                  'type': ContentType.textHtml.name,
                  '_content': value,
                },
              ],
            },
          }
        }
      };
      final api = mockApi(data);
      final response = await api.createSignature(Signature(name: faker.lorem.word()));
      final signature = response!.signature!;

      expect(signature.name, name);
      expect(signature.id, id);
      expect(signature.cid, cid);

      final content = signature.contents.first;
      expect(content.type, ContentType.textHtml);
      expect(content.value, value);
    }));

    test('Delete identity test', (() async {
      final data = {
        'Body': {
          'DeleteIdentityResponse': {
            '_jsns': 'urn:zimbraAccount',
          }
        }
      };
      final api = mockApi(data);
      final response = await api.deleteIdentity(NameId(name: faker.lorem.word()));
      expect(response, isNotNull);
      expect(response, isA<DeleteIdentityResponse>());
    }));

    test('Delete signature test', (() async {
      final data = {
        'Body': {
          'DeleteSignatureResponse': {
            '_jsns': 'urn:zimbraAccount',
          }
        }
      };
      final api = mockApi(data);
      final response = await api.deleteSignature(NameId(name: faker.lorem.word()));
      expect(response, isNotNull);
      expect(response, isA<DeleteSignatureResponse>());
    }));

    test('Discover rights test', (() async {
      final right = faker.lorem.word();
      final name = faker.internet.email();
      final id = faker.guid.guid();
      final displayName = faker.person.name();
      final addr = faker.internet.email();

      final data = {
        'Body': {
          'DiscoverRightsResponse': {
            '_jsns': 'urn:zimbraAccount',
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
          }
        }
      };
      final api = mockApi(data);
      final response = await api.discoverRights();
      final discoveredRight = response!.discoveredRights.first;

      expect(discoveredRight.right, right);

      final target = discoveredRight.targets.first;
      expect(target.type, TargetType.account);
      expect(target.id, id);
      expect(target.name, name);
      expect(target.displayName, displayName);

      final email = target.emails.first;
      expect(email.addr, addr);
    }));

    test('Distribution list action test', (() async {
      final data = {
        'Body': {
          'DistributionListActionResponse': {
            '_jsns': 'urn:zimbraAccount',
          }
        }
      };
      final api = mockApi(data);
      final response = await api.distributionListAction(
          DistributionListSelector(DistributionListBy.name, faker.internet.email()),
          DistributionListAction(Operation.modify));
      expect(response, isNotNull);
      expect(response, isA<DistributionListActionResponse>());
    }));

    test('End session test', (() async {
      final data = {
        'Body': {
          'EndSessionResponse': {
            '_jsns': 'urn:zimbraAccount',
          }
        }
      };
      final api = mockApi(data);
      final response = await api.endSession();
      expect(response, isNotNull);
      expect(response, isA<EndSessionResponse>());
    }));

    test('Get account distribution lists test', (() async {
      final name = faker.internet.email();
      final id = faker.guid.guid();
      final ref = faker.internet.email();
      final displayName = faker.person.name();
      final isDynamic = faker.randomGenerator.boolean();
      final via = faker.internet.email();
      final isOwner = faker.randomGenerator.boolean();
      final isMember = faker.randomGenerator.boolean();
      final key = faker.lorem.word();
      final value = faker.lorem.word();

      final data = {
        'Body': {
          'GetAccountDistributionListsResponse': {
            '_jsns': 'urn:zimbraAccount',
            'dl': [
              {
                'name': name,
                'id': id,
                'ref': ref,
                'd': displayName,
                'dynamic': isDynamic,
                'via': via,
                'isOwner': isOwner,
                'isMember': isMember,
                '_attrs': {
                  key: value,
                },
              }
            ],
          },
        },
      };
      final api = mockApi(data);
      final response = await api.getAccountDistributionLists();

      final dl = response!.dlList.first;
      expect(dl.name, name);
      expect(dl.id, id);
      expect(dl.ref, ref);
      expect(dl.displayName, displayName);
      expect(dl.isDynamic, isDynamic);
      expect(dl.via, via);
      expect(dl.isOwner, isOwner);
      expect(dl.isMember, isMember);

      final attr = dl.attrList.first;
      expect(attr.key, key);
      expect(attr.value, value);
    }));

    test('Get account info test', (() async {
      final email = faker.internet.email();
      final name = faker.lorem.word();
      final value = faker.lorem.word();
      final soapURL = faker.internet.httpsUrl();
      final publicURL = faker.internet.httpsUrl();
      final changePasswordURL = faker.internet.httpsUrl();
      final communityURL = faker.internet.httpsUrl();
      final adminURL = faker.internet.httpsUrl();
      final boshURL = faker.internet.httpsUrl();

      final data = {
        'Body': {
          'GetAccountInfoResponse': {
            '_jsns': 'urn:zimbraAccount',
            'name': email,
            '_attrs': {
              name: value,
            },
            'soapURL': soapURL,
            'publicURL': publicURL,
            'changePasswordURL': changePasswordURL,
            'communityURL': communityURL,
            'adminURL': adminURL,
            'boshURL': boshURL,
          },
        },
      };
      final api = mockApi(data);
      final response = await api.getAccountInfo(AccountSelector(AccountBy.name, faker.internet.email()));

      expect(response!.name, email);
      expect(response.soapURL, soapURL);
      expect(response.publicURL, publicURL);
      expect(response.changePasswordURL, changePasswordURL);
      expect(response.communityURL, communityURL);
      expect(response.adminURL, adminURL);
      expect(response.boshURL, boshURL);

      final attr = response.attrs.first;
      expect(attr.name, name);
      expect(attr.value, value);
    }));

    test('Get all locales test', (() async {
      final id = faker.guid.guid();
      final name = faker.lorem.word();
      final localName = faker.lorem.word();

      final data = {
        'Body': {
          'GetAllLocalesResponse': {
            '_jsns': 'urn:zimbraAccount',
            'locale': [
              {
                'id': id,
                'name': name,
                'localName': localName,
              }
            ],
          },
        },
      };
      final api = mockApi(data);
      final response = await api.getAllLocales();
      final locale = response!.locales.first;

      expect(locale.id, id);
      expect(locale.name, name);
      expect(locale.localName, localName);
    }));

    test('Get available csv formats test', (() async {
      final name = faker.lorem.word();
      final data = {
        'Body': {
          'GetAvailableCsvFormatsResponse': {
            '_jsns': 'urn:zimbraAccount',
            'csv': [
              {
                'name': name,
              }
            ],
          },
        },
      };
      final api = mockApi(data);
      final response = await api.getAvailableCsvFormats();
      final csv = response!.csvFormats.first;
      expect(csv.name, name);
    }));

    test('Get available locales test', (() async {
      final id = faker.guid.guid();
      final name = faker.lorem.word();
      final localName = faker.lorem.word();

      final data = {
        'Body': {
          'GetAvailableLocalesResponse': {
            '_jsns': 'urn:zimbraAccount',
            'locale': [
              {
                'id': id,
                'name': name,
                'localName': localName,
              }
            ],
          },
        },
      };
      final api = mockApi(data);
      final response = await api.getAvailableLocales();
      final locale = response!.locales.first;

      expect(locale.id, id);
      expect(locale.name, name);
      expect(locale.localName, localName);
    }));

    test('Get available skins test', (() async {
      final name = faker.lorem.word();
      final data = {
        'Body': {
          'GetAvailableSkinsResponse': {
            '_jsns': 'urn:zimbraAccount',
            'skin': [
              {
                'name': name,
              }
            ],
          },
        },
      };
      final api = mockApi(data);
      final response = await api.getAvailableSkins();
      final skin = response!.skins.first;
      expect(skin.name, name);
    }));

    test('Get distribution list members test', (() async {
      final more = faker.randomGenerator.boolean();
      final total = faker.randomGenerator.integer(100);
      final member = faker.internet.email();
      final seniorityIndex = faker.randomGenerator.integer(10);
      final name = faker.lorem.word();
      final value = faker.lorem.word();

      final data = {
        'Body': {
          'GetDistributionListMembersResponse': {
            '_jsns': 'urn:zimbraAccount',
            'more': more,
            'total': total,
            'dlm': [
              {'_content': member}
            ],
            'groupMember': [
              {
                'name': member,
                'seniorityIndex': seniorityIndex,
                '_attrs': {
                  name: value,
                },
              }
            ],
          }
        }
      };
      final api = mockApi(data);
      final response = await api.getDistributionListMembers(faker.internet.email());

      expect(response!.more, more);
      expect(response.total, total);
      expect(response.dlMembers.first, member);

      final groupMember = response.habGroupMembers.first;
      expect(groupMember.name, member);
      expect(groupMember.seniorityIndex, seniorityIndex);

      final attr = groupMember.attrs.first;
      expect(attr.name, name);
      expect(attr.value, value);
    }));

    test('Get distribution list test', (() async {
      final id = faker.guid.guid();
      final name = faker.internet.email();
      final key = faker.lorem.word();
      final value = faker.lorem.word();
      final isOwner = faker.randomGenerator.boolean();
      final isMember = faker.randomGenerator.boolean();
      final isDynamic = faker.randomGenerator.boolean();
      final member = faker.internet.email();
      final rightName = faker.lorem.word();

      final data = {
        'Body': {
          'GetDistributionListResponse': {
            '_jsns': 'urn:zimbraAccount',
            'dl': {
              'name': name,
              'id': id,
              'isOwner': isOwner,
              'isMember': isMember,
              'dynamic': isDynamic,
              'dlm': [
                {'_content': member}
              ],
              'owner': [
                {
                  'type': GranteeType.usr.name,
                  'id': id,
                  'name': name,
                }
              ],
              'right': [
                {
                  'right': rightName,
                  'grantee': [
                    {
                      'type': GranteeType.usr.name,
                      'id': id,
                      'name': name,
                    }
                  ],
                }
              ],
              '_attrs': {
                key: value,
              },
            },
          }
        }
      };
      final api = mockApi(data);
      final response = await api.getDistributionList(
        DistributionListSelector(DistributionListBy.name, faker.internet.email()),
      );
      final dl = response!.dl!;

      expect(dl.name, name);
      expect(dl.id, id);
      expect(dl.isOwner, isOwner);
      expect(dl.isMember, isMember);
      expect(dl.isDynamic, isDynamic);
      expect(dl.members.first, member);

      final owner = dl.owners.first;
      expect(owner.type, GranteeType.usr);
      expect(owner.id, id);
      expect(owner.name, name);

      final right = dl.rights.first;
      expect(right.right, rightName);

      final grantee = right.grantees.first;
      expect(grantee.type, GranteeType.usr);
      expect(grantee.id, id);
      expect(grantee.name, name);

      final attr = dl.attrList.first;
      expect(attr.key, key);
      expect(attr.value, value);
    }));

    test('Get identities test', (() async {
      final email = faker.internet.email();
      final id = faker.guid.guid();
      final name = faker.lorem.word();
      final value = faker.lorem.word();

      final data = {
        'Body': {
          'GetIdentitiesResponse': {
            '_jsns': 'urn:zimbraAccount',
            'identity': [
              {
                'name': email,
                'id': id,
                '_attrs': {
                  name: value,
                },
              }
            ],
          }
        }
      };
      final api = mockApi(data);
      final response = await api.getIdentities();
      final identity = response!.identities.first;

      expect(identity.name, email);
      expect(identity.id, id);

      final attr = identity.attrs.first;
      expect(attr.name, name);
      expect(attr.value, value);
    }));

    test('Get info test', (() async {
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
      final isEnabled = faker.randomGenerator.boolean();
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
        'isEnabled': isEnabled,
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

      final data = {
        'Body': {
          'GetInfoResponse': {
            '_jsns': 'urn:zimbraAccount',
            'attSizeLimit': attachmentSizeLimit,
            'docSizeLimit': documentSizeLimit,
            'version': version,
            'id': accountId,
            'profileImageId': profileImageId,
            'name': accountName,
            'crumb': crumb,
            'lifetime': lifetime,
            'adminDelegated': adminDelegated,
            'rest': restUrl,
            'used': quotaUsed,
            'prevSession': previousSessionTime,
            'accessed': lastWriteAccessTime,
            'recent': recentMessageCount,
            'cos': {
              'id': id,
              'name': name,
            },
            'prefs': {
              '_attrs': {
                name: value,
              }
            },
            'attrs': {
              '_attrs': {
                name: value,
              }
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
                  '_attrs': {
                    name: value,
                  },
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
                  'attrs': [
                    {
                      'attr': [
                        {
                          'name': name,
                          'pd': permDenied,
                          '_content': value,
                        }
                      ]
                    }
                  ],
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
            'soapURL': soapURL,
            'publicURL': publicURL,
            'changePasswordURL': changePasswordURL,
            'adminURL': adminURL,
            'boshURL': boshURL,
            'isTrackingIMAP': isTrackingIMAP,
          }
        }
      };
      final api = mockApi(data);
      final response = await api.getInfo();

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
      expect(imap.toMap(), dataSource);
      expect(pop3.toMap(), pop3DataSource);
      expect(caldav.toMap(), dataSource);
      expect(yab.toMap(), dataSource);
      expect(rss.toMap(), dataSource);
      expect(gal.toMap(), dataSource);
      expect(cal.toMap(), dataSource);
      expect(unknown.toMap(), dataSource);

      expect(response.prefs.first.name, name);
      expect(response.prefs.first.value, value);

      expect(response.attrs.first.name, name);
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

    test('Get OAuth consumers test', (() async {
      final accessToken = faker.lorem.word();
      final approvedOn = faker.lorem.word();
      final applicationName = faker.lorem.word();
      final device = faker.lorem.word();

      final data = {
        'Body': {
          'GetOAuthConsumersResponse': {
            '_jsns': 'urn:zimbraAccount',
            'OAuthConsumer': [
              {
                'accessToken': accessToken,
                'approvedOn': approvedOn,
                'appName': applicationName,
                'device': device,
              }
            ],
          }
        }
      };
      final api = mockApi(data);
      final response = await api.getOAuthConsumers();
      final consumer = response!.consumers.first;

      expect(consumer.accessToken, accessToken);
      expect(consumer.approvedOn, approvedOn);
      expect(consumer.applicationName, applicationName);
      expect(consumer.device, device);
    }));

    test('Get prefs test', (() async {
      final name = faker.lorem.word();
      final value = faker.lorem.word();

      final data = {
        'Body': {
          'GetPrefsResponse': {
            '_jsns': 'urn:zimbraAccount',
            '_attrs': {
              name: value,
            },
          }
        },
      };
      final api = mockApi(data);
      final response = await api.getPrefs();
      final pref = response!.prefs.first;
      expect(pref.name, name);
      expect(pref.value, value);
    }));

    test('Get rights test', (() async {
      final right = faker.lorem.word();
      final zimbraId = faker.guid.guid();
      final displayName = faker.person.name();
      final accessKey = faker.lorem.word();
      final password = faker.internet.password();
      final deny = faker.randomGenerator.boolean();
      final checkGranteeType = faker.randomGenerator.boolean();

      final data = {
        'Body': {
          'GetRightsResponse': {
            '_jsns': 'urn:zimbraAccount',
            'ace': [
              {
                'gt': GranteeType.usr.name,
                'right': right,
                'zid': zimbraId,
                'd': displayName,
                'key': accessKey,
                'pw': password,
                'deny': deny,
                'chkgt': checkGranteeType,
              }
            ],
          }
        },
      };
      final api = mockApi(data);
      final response = await api.getRights();
      final ace = response!.aces.first;

      expect(ace.granteeType, GranteeType.usr);
      expect(ace.right, right);
      expect(ace.zimbraId, zimbraId);
      expect(ace.displayName, displayName);
      expect(ace.accessKey, accessKey);
      expect(ace.password, password);
      expect(ace.deny, deny);
      expect(ace.checkGranteeType, checkGranteeType);
    }));

    test('Get share info test', (() async {
      final ownerId = faker.guid.guid();
      final ownerEmail = faker.internet.email();
      final ownerDisplayName = faker.person.name();
      final folderId = faker.randomGenerator.integer(100);
      final folderUuid = faker.guid.guid();
      final folderPath = faker.lorem.word();
      final defaultView = faker.lorem.word();
      final rights = faker.lorem.words(3).join(',');
      final granteeType = faker.lorem.word();
      final granteeId = faker.guid.guid();
      final granteeName = faker.internet.email();
      final granteeDisplayName = faker.person.name();
      final mountpointId = faker.guid.guid();

      final data = {
        'Body': {
          'GetShareInfoResponse': {
            '_jsns': 'urn:zimbraAccount',
            'share': [
              {
                'ownerId': ownerId,
                'ownerEmail': ownerEmail,
                'ownerName': ownerDisplayName,
                'folderId': folderId,
                'folderUuid': folderUuid,
                'folderPath': folderPath,
                'view': defaultView,
                'rights': rights,
                'granteeType': granteeType,
                'granteeId': granteeId,
                'granteeName': granteeName,
                'granteeDisplayName': granteeDisplayName,
                'mid': mountpointId,
              }
            ],
          }
        },
      };
      final api = mockApi(data);
      final response = await api.getShareInfo();
      final share = response!.shares.first;

      expect(share.ownerId, ownerId);
      expect(share.ownerEmail, ownerEmail);
      expect(share.ownerDisplayName, ownerDisplayName);
      expect(share.folderId, folderId);
      expect(share.folderUuid, folderUuid);
      expect(share.folderPath, folderPath);
      expect(share.defaultView, defaultView);
      expect(share.rights, rights);
      expect(share.granteeType, granteeType);
      expect(share.granteeId, granteeId);
      expect(share.granteeName, granteeName);
      expect(share.granteeDisplayName, granteeDisplayName);
      expect(share.mountpointId, mountpointId);
    }));

    test('Get signatures test', (() async {
      final name = faker.lorem.word();
      final id = faker.guid.guid();
      final cid = faker.guid.guid();
      final value = faker.lorem.word();

      final data = {
        'Body': {
          'GetSignaturesResponse': {
            '_jsns': 'urn:zimbraAccount',
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
          }
        }
      };
      final api = mockApi(data);
      final response = await api.getSignatures();
      final signature = response!.signatures.first;

      expect(signature.name, name);
      expect(signature.id, id);
      expect(signature.cid, cid);

      final content = signature.contents.first;
      expect(content.type, ContentType.textHtml);
      expect(content.value, value);
    }));

    test('Get version info test', (() async {
      final fullVersion = faker.lorem.word();
      final release = faker.lorem.word();
      final buildDate = faker.date.dateTime().toString();
      final host = faker.internet.ipv4Address();

      final data = {
        'Body': {
          'GetVersionInfoResponse': {
            '_jsns': 'urn:zimbraAccount',
            'info': {
              'version': fullVersion,
              'release': release,
              'buildDate': buildDate,
              'host': host,
            },
          }
        }
      };
      final api = mockApi(data);
      final response = await api.getVersionInfo();
      final versionInfo = response!.versionInfo!;

      expect(versionInfo.fullVersion, fullVersion);
      expect(versionInfo.release, release);
      expect(versionInfo.date, buildDate);
      expect(versionInfo.host, host);
    }));

    test('Get white black list test', (() async {
      final whiteEntry = faker.lorem.word();
      final blackEntry = faker.lorem.word();
      final data = {
        'Body': {
          'GetWhiteBlackListResponse': {
            '_jsns': 'urn:zimbraAccount',
            'whiteList': [
              {'_content': whiteEntry}
            ],
            'blackList': [
              {'_content': blackEntry}
            ],
          }
        }
      };
      final api = mockApi(data);
      final response = await api.getWhiteBlackList();
      expect(response!.whiteListEntries.first, whiteEntry);
      expect(response.blackListEntries.first, blackEntry);
    }));

    test('Grant rights test', (() async {
      final right = faker.lorem.word();
      final zimbraId = faker.guid.guid();
      final displayName = faker.person.name();
      final accessKey = faker.lorem.word();
      final password = faker.internet.password();
      final deny = faker.randomGenerator.boolean();
      final checkGranteeType = faker.randomGenerator.boolean();

      final data = {
        'Body': {
          'GrantRightsResponse': {
            '_jsns': 'urn:zimbraAccount',
            'ace': [
              {
                'gt': GranteeType.usr.name,
                'right': right,
                'zid': zimbraId,
                'd': displayName,
                'key': accessKey,
                'pw': password,
                'deny': deny,
                'chkgt': checkGranteeType,
              }
            ],
          }
        },
      };
      final api = mockApi(data);
      final response = await api.grantRights();
      final ace = response!.aces.first;

      expect(ace.granteeType, GranteeType.usr);
      expect(ace.right, right);
      expect(ace.zimbraId, zimbraId);
      expect(ace.displayName, displayName);
      expect(ace.accessKey, accessKey);
      expect(ace.password, password);
      expect(ace.deny, deny);
      expect(ace.checkGranteeType, checkGranteeType);
    }));

    test('Modify identity test', (() async {
      final data = {
        'Body': {
          'ModifyIdentityResponse': {
            '_jsns': 'urn:zimbraAccount',
          }
        }
      };
      final api = mockApi(data);
      final response = await api.modifyIdentity(Identity(name: faker.lorem.word()));
      expect(response, isNotNull);
      expect(response, isA<ModifyIdentityResponse>());
    }));

    test('Modify prefs test', (() async {
      final data = {
        'Body': {
          'ModifyPrefsResponse': {
            '_jsns': 'urn:zimbraAccount',
          }
        }
      };
      final api = mockApi(data);
      final response = await api.modifyPrefs();
      expect(response, isNotNull);
      expect(response, isA<ModifyPrefsResponse>());
    }));

    test('Modify properties test', (() async {
      final data = {
        'Body': {
          'ModifyPropertiesResponse': {
            '_jsns': 'urn:zimbraAccount',
          }
        }
      };
      final api = mockApi(data);
      final response = await api.modifyProperties();
      expect(response, isNotNull);
      expect(response, isA<ModifyPropertiesResponse>());
    }));

    test('Modify signature test', (() async {
      final data = {
        'Body': {
          'ModifySignatureResponse': {
            '_jsns': 'urn:zimbraAccount',
          }
        }
      };
      final api = mockApi(data);
      final response = await api.modifySignature(Signature(name: faker.lorem.word()));
      expect(response, isNotNull);
      expect(response, isA<ModifySignatureResponse>());
    }));

    test('Modify white black list test', (() async {
      final data = {
        'Body': {
          'ModifyWhiteBlackListResponse': {
            '_jsns': 'urn:zimbraAccount',
          }
        }
      };
      final api = mockApi(data);
      final response = await api.modifyWhiteBlackList();
      expect(response, isNotNull);
      expect(response, isA<ModifyWhiteBlackListResponse>());
    }));

    test('Modify zimlet prefs test', (() async {
      final zimlet1 = faker.lorem.word();
      final zimlet2 = faker.lorem.word();
      final data = {
        'Body': {
          'ModifyZimletPrefsResponse': {
            '_jsns': 'urn:zimbraAccount',
            'zimlet': [
              {'_content': zimlet1},
              {'_content': zimlet2},
            ],
          }
        }
      };
      final api = mockApi(data);
      final response = await api.modifyZimletPrefs();
      expect(response!.zimlets, [zimlet1, zimlet2]);
    }));

    test('Reset password test', (() async {
      final data = {
        'Body': {
          'ResetPasswordResponse': {
            '_jsns': 'urn:zimbraAccount',
          }
        }
      };
      final api = mockApi(data);
      final response = await api.resetPassword(faker.internet.password());
      expect(response, isNotNull);
      expect(response, isA<ResetPasswordResponse>());
    }));

    test('Revoke OAuth consumer test', (() async {
      final data = {
        'Body': {
          'RevokeOAuthConsumerResponse': {
            '_jsns': 'urn:zimbraAccount',
          }
        }
      };
      final api = mockApi(data);
      final response = await api.revokeOAuthConsumer(faker.guid.guid());
      expect(response, isNotNull);
      expect(response, isA<RevokeOAuthConsumerResponse>());
    }));

    test('Revoke rights test', (() async {
      final right = faker.lorem.word();
      final zimbraId = faker.guid.guid();
      final displayName = faker.person.name();
      final accessKey = faker.lorem.word();
      final password = faker.internet.password();
      final deny = faker.randomGenerator.boolean();
      final checkGranteeType = faker.randomGenerator.boolean();

      final data = {
        'Body': {
          'RevokeRightsResponse': {
            '_jsns': 'urn:zimbraAccount',
            'ace': [
              {
                'gt': GranteeType.usr.name,
                'right': right,
                'zid': zimbraId,
                'd': displayName,
                'key': accessKey,
                'pw': password,
                'deny': deny,
                'chkgt': checkGranteeType,
              }
            ],
          }
        },
      };
      final api = mockApi(data);
      final response = await api.revokeRights();
      final ace = response!.aces.first;

      expect(ace.granteeType, GranteeType.usr);
      expect(ace.right, right);
      expect(ace.zimbraId, zimbraId);
      expect(ace.displayName, displayName);
      expect(ace.accessKey, accessKey);
      expect(ace.password, password);
      expect(ace.deny, deny);
      expect(ace.checkGranteeType, checkGranteeType);
    }));

    test('Search calendar resources test', (() async {
      final sortBy = faker.lorem.word();
      final offset = faker.randomGenerator.integer(100);
      final more = faker.randomGenerator.boolean();
      final pagingSupported = faker.randomGenerator.boolean();

      final name = faker.lorem.word();
      final id = faker.guid.guid();
      final key = faker.lorem.word();
      final value = faker.lorem.word();

      final data = {
        'Body': {
          'SearchCalendarResourcesResponse': {
            '_jsns': 'urn:zimbraAccount',
            'sortBy': sortBy,
            'offset': offset,
            'more': more,
            'paginationSupported': pagingSupported,
            'calresource': [
              {
                'name': name,
                'id': id,
                '_attrs': {
                  key: value,
                },
              }
            ],
          }
        }
      };
      final api = mockApi(data);
      final response = await api.searchCalendarResources();

      expect(response!.sortBy, sortBy);
      expect(response.offset, offset);
      expect(response.more, more);
      expect(response.pagingSupported, pagingSupported);

      final resource = response.calendarResources.first;
      expect(resource.name, name);
      expect(resource.id, id);
      expect(resource.keyValuePairs.first.key, key);
      expect(resource.keyValuePairs.first.value, value);
    }));

    test('Search gal test', (() async {
      final sortBy = faker.lorem.word();
      final offset = faker.randomGenerator.integer(100);
      final more = faker.randomGenerator.boolean();
      final pagingSupported = faker.randomGenerator.boolean();
      final tokenizeKey = faker.randomGenerator.boolean();

      final sortField = faker.lorem.word();
      final canExpand = faker.randomGenerator.boolean();
      final id = faker.guid.guid();
      final folder = faker.lorem.word();
      final flags = faker.lorem.word();
      final tags = faker.lorem.word();
      final tagNames = faker.lorem.word();
      final changeDate = faker.date.dateTime().millisecondsSinceEpoch;
      final modifiedSequenceId = faker.randomGenerator.integer(100);
      final date = faker.date.dateTime().millisecondsSinceEpoch;
      final revisionId = faker.randomGenerator.integer(100);
      final fileAs = faker.lorem.word();
      final email = faker.internet.email();
      final email2 = faker.internet.email();
      final email3 = faker.internet.email();
      final type = faker.lorem.word();
      final dlist = faker.lorem.word();
      final reference = faker.lorem.word();
      final tooManyMembers = faker.randomGenerator.boolean();
      final isOwner = faker.randomGenerator.boolean();
      final isMember = faker.randomGenerator.boolean();

      final section = faker.lorem.word();
      final key = faker.lorem.word();
      final value = faker.lorem.word();

      final data = {
        'Body': {
          'SearchGalResponse': {
            '_jsns': 'urn:zimbraAccount',
            'sortBy': sortBy,
            'offset': offset,
            'more': more,
            'paginationSupported': pagingSupported,
            'tokenizeKey': tokenizeKey,
            'cn': [
              {
                'sf': sortField,
                'exp': canExpand,
                'id': id,
                'l': folder,
                'f': flags,
                't': tags,
                'tn': tagNames,
                'md': changeDate,
                'ms': modifiedSequenceId,
                'd': date,
                'rev': revisionId,
                'fileAsStr': fileAs,
                'email': email,
                'email2': email2,
                'email3': email3,
                'type': type,
                'dlist': dlist,
                'ref': reference,
                'tooManyMembers': tooManyMembers,
                'isOwner': isOwner,
                'isMember': isMember,
                'meta': [
                  {
                    'section': section,
                    '_attrs': {
                      key: value,
                    },
                  },
                ],
                '_attrs': {
                  key: value,
                },
                'm': [
                  {
                    'type': type,
                    'value': value,
                  },
                ],
              },
            ],
          }
        }
      };
      final api = mockApi(data);
      final response = await api.searchGal();
      final contact = response!.contacts.first;

      expect(response.sortBy, sortBy);
      expect(response.offset, offset);
      expect(response.more, more);
      expect(response.pagingSupported, pagingSupported);
      expect(response.tokenizeKey, tokenizeKey);

      expect(contact.sortField, sortField);
      expect(contact.canExpand, canExpand);
      expect(contact.id, id);
      expect(contact.folder, folder);
      expect(contact.flags, flags);
      expect(contact.tags, tags);
      expect(contact.tagNames, tagNames);
      expect(contact.changeDate, changeDate);
      expect(contact.modifiedSequenceId, modifiedSequenceId);
      expect(contact.date, date);
      expect(contact.revisionId, revisionId);
      expect(contact.fileAs, fileAs);
      expect(contact.email, email);
      expect(contact.email2, email2);
      expect(contact.email3, email3);
      expect(contact.type, type);
      expect(contact.dlist, dlist);
      expect(contact.reference, reference);
      expect(contact.tooManyMembers, tooManyMembers);
      expect(contact.isOwner, isOwner);
      expect(contact.isMember, isMember);

      final meta = contact.metadatas.first;
      final kvp = meta.keyValuePairs.first;
      expect(meta.section, section);
      expect(kvp.key, key);
      expect(kvp.value, value);

      final attr = contact.attrs.first;
      expect(attr.key, key);
      expect(attr.value, value);

      final member = contact.contactGroupMembers.first;
      expect(member.type, type);
      expect(member.value, value);
    }));

    test('Subscribe distribution list test', (() async {
      final data = {
        'Body': {
          'SubscribeDistributionListResponse': {
            '_jsns': 'urn:zimbraAccount',
            'status': DistributionListSubscribeStatus.subscribed.name,
          }
        }
      };
      final api = mockApi(data);
      final response = await api.subscribeDistributionList(
        DistributionListSelector(DistributionListBy.name, faker.internet.email()),
      );
      expect(response!.status, DistributionListSubscribeStatus.subscribed);
    }));

    test('Sync gal test', (() async {
      final more = faker.randomGenerator.boolean();
      final token = faker.guid.guid();
      final galDefinitionLastModified = faker.lorem.word();
      final throttled = faker.randomGenerator.boolean();
      final fullSyncRecommended = faker.randomGenerator.boolean();
      final remain = faker.randomGenerator.integer(100);

      final sortField = faker.lorem.word();
      final canExpand = faker.randomGenerator.boolean();
      final id = faker.guid.guid();
      final folder = faker.lorem.word();
      final flags = faker.lorem.word();
      final tags = faker.lorem.word();
      final tagNames = faker.lorem.word();
      final changeDate = faker.date.dateTime().millisecondsSinceEpoch;
      final modifiedSequenceId = faker.randomGenerator.integer(100);
      final date = faker.date.dateTime().millisecondsSinceEpoch;
      final revisionId = faker.randomGenerator.integer(100);
      final fileAs = faker.lorem.word();
      final email = faker.internet.email();
      final email2 = faker.internet.email();
      final email3 = faker.internet.email();
      final type = faker.lorem.word();
      final dlist = faker.lorem.word();
      final reference = faker.lorem.word();
      final tooManyMembers = faker.randomGenerator.boolean();
      final isOwner = faker.randomGenerator.boolean();
      final isMember = faker.randomGenerator.boolean();

      final section = faker.lorem.word();
      final key = faker.lorem.word();
      final value = faker.lorem.word();

      final data = {
        'Body': {
          'SyncGalResponse': {
            '_jsns': 'urn:zimbraAccount',
            'more': more,
            'token': token,
            'galDefinitionLastModified': galDefinitionLastModified,
            'throttled': throttled,
            'fullSyncRecommended': fullSyncRecommended,
            'remain': remain,
            'cn': [
              {
                'sf': sortField,
                'exp': canExpand,
                'id': id,
                'l': folder,
                'f': flags,
                't': tags,
                'tn': tagNames,
                'md': changeDate,
                'ms': modifiedSequenceId,
                'd': date,
                'rev': revisionId,
                'fileAsStr': fileAs,
                'email': email,
                'email2': email2,
                'email3': email3,
                'type': type,
                'dlist': dlist,
                'ref': reference,
                'tooManyMembers': tooManyMembers,
                'isOwner': isOwner,
                'isMember': isMember,
                'meta': [
                  {
                    'section': section,
                    '_attrs': {
                      key: value,
                    },
                  },
                ],
                '_attrs': {
                  key: value,
                },
                'm': [
                  {
                    'type': type,
                    'value': value,
                  },
                ],
              },
            ],
            'deleted': [
              {
                'id': id,
              }
            ],
          }
        }
      };
      final api = mockApi(data);
      final response = await api.syncGal();
      final deleted = response!.deleted.first;
      final contact = response.contacts.first;

      expect(response.more, more);
      expect(response.token, token);
      expect(response.galDefinitionLastModified, galDefinitionLastModified);
      expect(response.throttled, throttled);
      expect(response.fullSyncRecommended, fullSyncRecommended);
      expect(response.remain, remain);
      expect(deleted.id, id);

      expect(contact.sortField, sortField);
      expect(contact.canExpand, canExpand);
      expect(contact.id, id);
      expect(contact.folder, folder);
      expect(contact.flags, flags);
      expect(contact.tags, tags);
      expect(contact.tagNames, tagNames);
      expect(contact.changeDate, changeDate);
      expect(contact.modifiedSequenceId, modifiedSequenceId);
      expect(contact.date, date);
      expect(contact.revisionId, revisionId);
      expect(contact.fileAs, fileAs);
      expect(contact.email, email);
      expect(contact.email2, email2);
      expect(contact.email3, email3);
      expect(contact.type, type);
      expect(contact.dlist, dlist);
      expect(contact.reference, reference);
      expect(contact.tooManyMembers, tooManyMembers);
      expect(contact.isOwner, isOwner);
      expect(contact.isMember, isMember);

      final meta = contact.metadatas.first;
      final kvp = meta.keyValuePairs.first;
      expect(meta.section, section);
      expect(kvp.key, key);
      expect(kvp.value, value);

      final attr = contact.attrs.first;
      expect(attr.key, key);
      expect(attr.value, value);

      final member = contact.contactGroupMembers.first;
      expect(member.type, type);
      expect(member.value, value);
    }));
  }));
}

AccountApi mockApi(Map<String, dynamic> responseData) {
  return AccountApi(
    Faker().internet.domainName(),
    httpClientFactory: () => MockClient((request) async {
      return http.Response(
        jsonEncode(responseData),
        200,
        headers: {'content-type': 'text/javascript; charset=utf-8'},
      );
    }),
  );
}
