import 'package:faker/faker.dart';
import 'package:test/test.dart';
import 'package:zimbra_api/src/common/enum/address_type.dart';
import 'package:zimbra_api/src/common/enum/alarm_action.dart';
import 'package:zimbra_api/src/common/enum/alarm_related.dart';
import 'package:zimbra_api/src/common/enum/free_busy_status.dart';
import 'package:zimbra_api/src/common/enum/frequency.dart';
import 'package:zimbra_api/src/common/enum/grant_grantee_type.dart';
import 'package:zimbra_api/src/common/enum/invite_class.dart';
import 'package:zimbra_api/src/common/enum/invite_status.dart';
import 'package:zimbra_api/src/common/enum/invite_type.dart';
import 'package:zimbra_api/src/common/enum/member_type.dart';
import 'package:zimbra_api/src/common/enum/participation_status.dart';
import 'package:zimbra_api/src/common/enum/policy_type.dart';
import 'package:zimbra_api/src/common/enum/search_sort_by.dart';
import 'package:zimbra_api/src/common/enum/transparency.dart';
import 'package:zimbra_api/src/common/enum/view_type.dart';
import 'package:zimbra_api/src/common/enum/week_day.dart';
import 'package:zimbra_api/src/mail/message/get_item_envelope.dart';
import 'package:zimbra_api/src/mail/message/get_item_request.dart';
import 'package:zimbra_api/src/mail/message/get_item_response.dart';
import 'package:zimbra_api/src/mail/type/add_recurrence_info.dart';
import 'package:zimbra_api/src/mail/type/calendar_item_info.dart';
import 'package:zimbra_api/src/mail/type/chat_summary.dart';
import 'package:zimbra_api/src/mail/type/exclude_recurrence_info.dart';
import 'package:zimbra_api/src/mail/type/folder.dart';
import 'package:zimbra_api/src/mail/type/item_spec.dart';
import 'package:zimbra_api/src/mail/type/message_summary.dart';
import 'package:zimbra_api/src/mail/type/recurrence_info.dart';
import 'package:zimbra_api/src/mail/type/task_item_info.dart';

void main() {
  final faker = Faker();

  group('Get item tests', (() {
    test('Get item request', (() {
      final id = faker.guid.guid();
      final folder = faker.guid.guid();
      final name = faker.lorem.word();
      final path = faker.lorem.word();

      final request = GetItemRequest(ItemSpec(
        id: id,
        folder: folder,
        name: name,
        path: path,
      ));
      expect(request.getEnvelope().toMap(), {
        'Body': {
          'GetItemRequest': {
            '_jsns': 'urn:zimbraMail',
            'item': {
              'id': id,
              'l': folder,
              'name': name,
              'path': path,
            },
          }
        },
      });
    }));

    test('Get item response', (() {
      final id = faker.guid.guid();
      final uid = faker.guid.guid();
      final uuid = faker.guid.guid();
      final name = faker.lorem.word();
      final absoluteFolderPath = faker.lorem.word();
      final parentId = faker.guid.guid();
      final folderUuid = faker.guid.guid();
      final flags = faker.lorem.word();
      final color = faker.randomGenerator.integer(127);
      final rgb = faker.randomGenerator.fromPatternToHex(['######']);
      final unreadCount = faker.randomGenerator.integer(100);
      final imapUnreadCount = faker.randomGenerator.integer(100);
      final revision = faker.randomGenerator.integer(100);
      final version = faker.randomGenerator.integer(100);
      final modifiedSequence = faker.randomGenerator.integer(100);
      final metadataVersion = faker.randomGenerator.integer(100);
      final changeDate = faker.date.dateTime().minute;
      final itemCount = faker.randomGenerator.integer(100);
      final imapItemCount = faker.randomGenerator.integer(100);
      final totalSize = faker.randomGenerator.integer(100);
      final imapModifiedSequence = faker.randomGenerator.integer(100);
      final imapUidNext = faker.randomGenerator.integer(100);
      final url = faker.internet.httpsUrl();
      final activeSyncDisabled = faker.randomGenerator.boolean();
      final webOfflineSyncDays = faker.randomGenerator.integer(100);
      final perm = faker.lorem.word();
      final recursive = faker.randomGenerator.boolean();
      final restUrl = faker.internet.httpsUrl();
      final deletable = faker.randomGenerator.boolean();

      final section = faker.lorem.word();
      final key = faker.lorem.word();
      final value = faker.lorem.word();
      final lifetime = faker.randomGenerator.integer(100).toString();

      final internalGrantExpiry = faker.randomGenerator.integer(100);
      final guestGrantExpiry = faker.randomGenerator.integer(100);

      final granteeId = faker.guid.guid();
      final expiry = faker.randomGenerator.integer(100);
      final granteeName = faker.person.name();
      final guestPassword = faker.internet.password();
      final accessKey = faker.internet.password();

      final ownerEmail = faker.internet.email();
      final ownerAccountId = faker.guid.guid();
      final remoteFolderId = faker.randomGenerator.integer(100);
      final remoteUuid = faker.guid.guid();
      final remoteFolderName = faker.lorem.word();
      final reminderEnabled = faker.randomGenerator.boolean();
      final broken = faker.randomGenerator.boolean();

      final query = faker.lorem.word();
      final types = faker.lorem.words(3).join(',');

      final unread = faker.randomGenerator.integer(100);
      final count = faker.randomGenerator.integer(100);
      final date = faker.date.dateTime().millisecondsSinceEpoch;

      final folder = faker.guid.guid();
      final folderId = faker.guid.guid();
      final tags = faker.lorem.word();
      final tagNames = faker.lorem.word();
      final bounds = faker.lorem.word();
      final content = faker.lorem.word();

      final sortField = faker.lorem.word();
      final canExpand = faker.randomGenerator.boolean();
      final imapUid = faker.randomGenerator.integer(100);
      final modifiedSequenceId = faker.randomGenerator.integer(100);
      final revisionId = faker.randomGenerator.integer(100);
      final fileAs = faker.lorem.word();
      final email = faker.internet.email();
      final email2 = faker.internet.email();
      final email3 = faker.internet.email();
      final type = faker.lorem.word();
      final dlist = faker.lorem.word();
      final reference = faker.lorem.word();
      final tooManyMembers = faker.randomGenerator.boolean();
      final memberOf = faker.internet.email();

      final part = faker.lorem.word();
      final contentType = faker.lorem.word();
      final size = faker.randomGenerator.integer(100);
      final contentFilename = faker.lorem.word();

      final nextAlarm = faker.date.dateTime().millisecondsSinceEpoch;
      final orphan = faker.randomGenerator.boolean();

      final sequence = faker.randomGenerator.integer(100);
      final componentNum = faker.randomGenerator.integer(100);
      final recurrenceId = faker.date.dateTime().toString();
      final seq = faker.randomGenerator.integer(100);

      final tzStdOffset = faker.randomGenerator.integer(100);
      final tzDayOffset = faker.randomGenerator.integer(100);
      final standardTZName = faker.lorem.word();
      final daylightTZName = faker.lorem.word();

      final recurrenceRangeType = faker.randomGenerator.integer(3, min: 1);
      final attendee = faker.internet.email();
      final sentBy = faker.internet.email();
      final timezone = faker.lorem.word();
      final recurIdZ = faker.date.dateTime().toString();

      final month = faker.date.dateTime().month;
      final hour = faker.date.dateTime().hour;
      final minute = faker.date.dateTime().minute;
      final second = faker.date.dateTime().second;
      final dayOfMonth = faker.randomGenerator.integer(31, min: 1);
      final week = faker.randomGenerator.integer(4, min: 1);
      final dayOfWeek = faker.randomGenerator.integer(7, min: 1);

      final category = faker.lorem.word();
      final comment = faker.lorem.word();
      final contact = faker.lorem.word();
      final latitude = faker.randomGenerator.decimal().toString();
      final longitude = faker.randomGenerator.decimal().toString();

      final address = faker.internet.email();
      final display = faker.person.name();
      final personal = faker.lorem.word();
      final displayName = faker.person.name();
      final dir = faker.lorem.word();
      final language = faker.address.countryCode();
      final cuType = faker.lorem.word();
      final role = faker.lorem.word();
      final member = faker.internet.email();
      final delegatedTo = faker.internet.email();
      final delegatedFrom = faker.internet.email();
      final utcTime = faker.date.dateTime().millisecond;
      final dateTimeString = faker.date.dateTime().toString();

      final durationNegative = faker.randomGenerator.boolean();
      final weeks = faker.randomGenerator.integer(100);
      final days = faker.randomGenerator.integer(100);
      final hours = faker.randomGenerator.integer(100);
      final minutes = faker.randomGenerator.integer(100);
      final seconds = faker.randomGenerator.integer(100);
      final repeatCount = faker.randomGenerator.integer(100);

      final summary = faker.guid.guid();
      final fragment = faker.lorem.word();
      final subject = faker.lorem.word();
      final description = faker.lorem.word();
      final htmlDescription = faker.lorem.word();
      final binaryB64Data = faker.lorem.word();

      final num = faker.randomGenerator.integer(100);
      final numUnread = faker.randomGenerator.integer(100);
      final ival = faker.randomGenerator.integer(100);
      final list = faker.randomGenerator.amount((_) => random.integer(10), 10).join(',');
      final ordWk = faker.randomGenerator.integer(100);

      final partStat = faker.randomGenerator.element(ParticipationStatus.values);
      final method = faker.lorem.word();
      final rsvp = faker.randomGenerator.boolean();
      final priority = faker.randomGenerator.integer(9).toString();
      final location = faker.address.streetAddress();
      final percentComplete = faker.randomGenerator.integer(100).toString();
      final completed = faker.date.dateTime().toString();
      final noBlob = faker.randomGenerator.boolean();
      final isOrganizer = faker.randomGenerator.boolean();
      final xUid = faker.guid.guid();
      final calItemId = faker.guid.guid();
      final deprecatedApptId = faker.guid.guid();
      final dateTime = faker.randomGenerator.integer(100);
      final calItemFolder = faker.lorem.word();
      final uri = faker.internet.uri('http');
      final isException = faker.randomGenerator.boolean();
      final isAllDay = faker.randomGenerator.boolean();
      final isDraft = faker.randomGenerator.boolean();
      final neverSent = faker.randomGenerator.boolean();
      final changes = faker.lorem.words(3).join(',');

      final contentDisposition = faker.lorem.word();
      final contentId = faker.guid.guid();
      final body = faker.randomGenerator.boolean();
      final truncatedContent = faker.randomGenerator.boolean();
      final elided = faker.randomGenerator.boolean();
      final isGroup = faker.randomGenerator.boolean();
      final canExpandGroupMembers = faker.randomGenerator.boolean();
      final descEnabled = faker.randomGenerator.boolean();

      final lastEditedBy = faker.lorem.word();
      final creator = faker.lorem.word();
      final createdDate = faker.date.dateTime().millisecondsSinceEpoch;
      final lockOwnerId = faker.guid.guid();
      final lockOwnerEmail = faker.internet.email();
      final lockOwnerTimestamp = faker.date.dateTime().toString();
      final autoSendTime = faker.randomGenerator.integer(100);
      final conversationId = faker.guid.guid();

      final data = {
        'Body': {
          'GetItemResponse': {
            '_jsns': 'urn:zimbraMail',
            'folder': {
              'id': id,
              'uuid': uuid,
              'name': name,
              'absFolderPath': absoluteFolderPath,
              'l': parentId,
              'luuid': folderUuid,
              'f': flags,
              'color': color,
              'rgb': rgb,
              'u': unreadCount,
              'i4u': imapUnreadCount,
              'view': ViewType.conversation.name,
              'rev': revision,
              'ms': modifiedSequence,
              'md': changeDate,
              'n': itemCount,
              'i4n': imapItemCount,
              's': totalSize,
              'i4ms': imapModifiedSequence,
              'i4next': imapUidNext,
              'url': url,
              'activesyncdisabled': activeSyncDisabled,
              'webOfflineSyncDays': webOfflineSyncDays,
              'perm': perm,
              'recursive': recursive,
              'rest': restUrl,
              'deletable': deletable,
              'meta': [
                {
                  'section': section,
                  '_attrs': {
                    key: value,
                  },
                }
              ],
              'acl': {
                'internalGrantExpiry': internalGrantExpiry,
                'guestGrantExpiry': guestGrantExpiry,
                'grant': [
                  {
                    'perm': perm,
                    'gt': GrantGranteeType.all.name,
                    'zid': granteeId,
                    'expiry': expiry,
                    'd': granteeName,
                    'pw': guestPassword,
                    'key': accessKey,
                  }
                ],
              },
              'folder': [
                {
                  'id': id,
                  'uuid': uuid,
                  'name': name,
                }
              ],
              'link': [
                {
                  'id': id,
                  'name': name,
                  'owner': ownerEmail,
                  'zid': ownerAccountId,
                  'rid': remoteFolderId,
                  'ruuid': remoteUuid,
                  'oname': remoteFolderName,
                  'reminder': reminderEnabled,
                  'broken': broken,
                }
              ],
              'search': [
                {
                  'id': id,
                  'name': name,
                  'query': query,
                  'sortBy': SearchSortBy.none.name,
                  'types': types,
                }
              ],
              'retentionPolicy': [
                {
                  'keep': [
                    {
                      'policy': [
                        {
                          'type': PolicyType.user.name,
                          'id': id,
                          'name': name,
                          'lifetime': lifetime,
                        }
                      ],
                    }
                  ],
                  'purge': [
                    {
                      'policy': [
                        {
                          'type': PolicyType.user.name,
                          'id': id,
                          'name': name,
                          'lifetime': lifetime,
                        }
                      ],
                    }
                  ],
                }
              ],
            },
            'tag': {
              'id': id,
              'name': name,
              'color': color,
              'rgb': rgb,
              'u': unread,
              'n': count,
              'd': date,
              'rev': revision,
              'md': changeDate,
              'ms': modifiedSequence,
              'meta': [
                {
                  'section': section,
                  '_attrs': {
                    key: value,
                  },
                }
              ],
              'retentionPolicy': {
                'keep': [
                  {
                    'policy': [
                      {
                        'type': PolicyType.user.name,
                        'id': id,
                        'name': name,
                        'lifetime': lifetime,
                      }
                    ]
                  }
                ],
                'purge': [
                  {
                    'policy': [
                      {
                        'type': PolicyType.user.name,
                        'id': id,
                        'name': name,
                        'lifetime': lifetime,
                      }
                    ]
                  }
                ],
              },
            },
            'note': {
              'id': id,
              'rev': revision,
              'l': folder,
              'd': date,
              'f': flags,
              't': tags,
              'tn': tagNames,
              'pos': bounds,
              'color': color,
              'rgb': rgb,
              'md': changeDate,
              'ms': modifiedSequence,
              'content': content,
              'meta': [
                {
                  'section': section,
                  '_attrs': {
                    key: value,
                  },
                }
              ],
            },
            'cn': {
              'sf': sortField,
              'exp': canExpand,
              'id': id,
              'i4uid': imapUid,
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
              'meta': [
                {
                  'section': section,
                  '_attrs': {
                    key: value,
                  },
                }
              ],
              '_attrs': {
                key: value,
              },
              'm': [
                {
                  'type': MemberType.contact.name,
                  '_content': value,
                  'cn': {
                    'sf': sortField,
                    'exp': canExpand,
                    'id': id,
                    'i4uid': imapUid,
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
                    'memberOf': {'_content': memberOf},
                  },
                }
              ],
              'memberOf': {'_content': memberOf},
            },
            'appt': {
              'f': flags,
              't': tags,
              'tn': tagNames,
              'uid': uid,
              'id': id,
              'rev': revision,
              's': size,
              'd': date,
              'l': folder,
              'md': changeDate,
              'ms': modifiedSequence,
              'nextAlarm': nextAlarm,
              'orphan': orphan,
              'inv': [
                {
                  'type': InviteType.appt.name,
                  'seq': sequence,
                  'id': id,
                  'compNum': componentNum,
                  'recurId': recurrenceId,
                  'tz': [
                    {
                      'id': id,
                      'stdoff': tzStdOffset,
                      'dayoff': tzDayOffset,
                      'standard': {
                        'mon': month,
                        'hour': hour,
                        'min': minute,
                        'sec': second,
                        'mday': dayOfMonth,
                        'week': week,
                        'wkday': dayOfWeek,
                      },
                      'daylight': {
                        'mon': month,
                        'hour': hour,
                        'min': minute,
                        'sec': second,
                        'mday': dayOfMonth,
                        'week': week,
                        'wkday': dayOfWeek,
                      },
                      'stdname': standardTZName,
                      'dayname': daylightTZName,
                    }
                  ],
                  'comp': {
                    'category': [
                      {'_content': category}
                    ],
                    'comment': [
                      {'_content': comment}
                    ],
                    'contact': [
                      {'_content': contact}
                    ],
                    'geo': {
                      'lat': latitude,
                      'lon': longitude,
                    },
                    'at': [
                      {
                        'a': address,
                        'url': url,
                        'd': displayName,
                        'sentBy': sentBy,
                        'dir': dir,
                        'lang': language,
                        'cutype': cuType,
                        'role': role,
                        'ptst': partStat.name,
                        'rsvp': rsvp,
                        'member': member,
                        'delegatedTo': delegatedTo,
                        'delegatedFrom': delegatedFrom,
                        'xparam': [
                          {
                            'name': name,
                            'value': value,
                          }
                        ],
                      }
                    ],
                    'alarm': [
                      {
                        'action': AlarmAction.display.name,
                        'trigger': {
                          'abs': {
                            'd': dateTimeString,
                          },
                          'rel': {
                            'd': dateTimeString,
                          },
                        },
                        'repeat': {
                          'neg': durationNegative,
                          'w': weeks,
                          'd': days,
                          'h': hours,
                          'm': minutes,
                          's': seconds,
                          'related': AlarmRelated.start.name,
                          'count': repeatCount,
                        },
                        'desc': {'_content': description},
                        'attach': {
                          'uri': uri,
                          'ct': contentType,
                          '_content': binaryB64Data,
                        },
                        'summary': {'_content': summary},
                        'at': [
                          {
                            'a': address,
                            'url': url,
                            'd': displayName,
                            'sentBy': sentBy,
                            'dir': dir,
                            'lang': language,
                            'cutype': cuType,
                            'role': role,
                            'ptst': partStat.name,
                            'rsvp': rsvp,
                            'member': member,
                            'delegatedTo': delegatedTo,
                            'delegatedFrom': delegatedFrom,
                            'xparam': [
                              {
                                'name': name,
                                'value': value,
                              }
                            ],
                          }
                        ],
                        'xprop': [
                          {
                            'name': name,
                            'value': value,
                            'xparam': [
                              {
                                'name': name,
                                'value': value,
                              }
                            ],
                          }
                        ],
                      }
                    ],
                    'xprop': [
                      {
                        'name': name,
                        'value': value,
                        'xparam': [
                          {
                            'name': name,
                            'value': value,
                          }
                        ],
                      }
                    ],
                    'fr': fragment,
                    'desc': {'_content': description},
                    'descHtml': {'_content': htmlDescription},
                    'or': {
                      'a': address,
                      'url': url,
                      'd': displayName,
                      'sentBy': sentBy,
                      'dir': dir,
                      'lang': language,
                      'xparam': [
                        {
                          'name': name,
                          'value': value,
                        }
                      ],
                    },
                    'recur': {
                      'add': [
                        {'add': {}}
                      ],
                      'exclude': [
                        {'exclude': {}}
                      ],
                      'except': [
                        {
                          'rangeType': recurrenceRangeType,
                          'recurId': recurrenceId,
                          'tz': timezone,
                          'ridZ': recurIdZ,
                          'add': {'add': []},
                          'exclude': {'exclude': []},
                        }
                      ],
                      'cancel': [
                        {
                          'rangeType': recurrenceRangeType,
                          'recurId': recurrenceId,
                          'tz': timezone,
                          'ridZ': recurIdZ,
                        }
                      ],
                      'dates': [
                        {
                          'tz': timezone,
                          'dtval': [
                            {
                              's': {
                                'd': dateTimeString,
                                'tz': timezone,
                                'u': utcTime,
                              },
                              'e': {
                                'd': dateTimeString,
                                'tz': timezone,
                                'u': utcTime,
                              },
                              'dur': {
                                'neg': durationNegative,
                                'w': weeks,
                                'd': days,
                                'h': hours,
                                'm': minutes,
                                's': seconds,
                                'related': AlarmRelated.start.name,
                                'count': repeatCount,
                              },
                            }
                          ],
                        }
                      ],
                      'rule': [
                        {
                          'freq': Frequency.second.name,
                          'until': {
                            'd': dateTimeString,
                          },
                          'count': {
                            'num': num,
                          },
                          'interval': {
                            'ival': ival,
                          },
                          'bysecond': {
                            'seclist': list,
                          },
                          'byminute': {
                            'minlist': list,
                          },
                          'byhour': {
                            'hrlist': list,
                          },
                          'byday': {
                            'wkday': [
                              {
                                'day': WeekDay.sunday.name,
                                'ordWk': ordWk,
                              }
                            ],
                          },
                          'bymonthday': {
                            'modaylist': list,
                          },
                          'byyearday': {
                            'yrdaylist': list,
                          },
                          'byweekno': {
                            'wklist': list,
                          },
                          'bymonth': {
                            'molist': list,
                          },
                          'bysetpos': {
                            'poslist': list,
                          },
                          'wkst': {
                            'day': WeekDay.sunday.name,
                          },
                          'rule-x-name': [
                            {
                              'name': name,
                              'value': value,
                            }
                          ],
                        }
                      ],
                    },
                    'exceptId': {
                      'd': dateTimeString,
                      'tz': timezone,
                      'rangeType': recurrenceRangeType,
                    },
                    's': {
                      'd': dateTimeString,
                      'tz': timezone,
                      'u': utcTime,
                    },
                    'e': {
                      'd': dateTimeString,
                      'tz': timezone,
                      'u': utcTime,
                    },
                    'dur': {
                      'neg': durationNegative,
                      'w': weeks,
                      'd': days,
                      'h': hours,
                      'm': minutes,
                      's': seconds,
                      'related': AlarmRelated.start.name,
                      'count': repeatCount,
                    },
                    'method': method,
                    'compNum': componentNum,
                    'rsvp': rsvp,
                    'priority': priority,
                    'name': name,
                    'loc': location,
                    'percentComplete': percentComplete,
                    'completed': completed,
                    'noBlob': noBlob,
                    'fba': FreeBusyStatus.free.name,
                    'fb': FreeBusyStatus.free.name,
                    'transp': Transparency.opaque.name,
                    'isOrg': isOrganizer,
                    'x_uid': xUid,
                    'uid': uid,
                    'seq': sequence,
                    'd': dateTime,
                    'calItemId': calItemId,
                    'apptId': deprecatedApptId,
                    'ciFolder': calItemFolder,
                    'status': InviteStatus.completed.name,
                    'class': InviteClass.public.name,
                    'url': url,
                    'ex': isException,
                    'ridZ': recurIdZ,
                    'allDay': isAllDay,
                    'draft': isDraft,
                    'neverSent': neverSent,
                    'changes': changes,
                  },
                  'mp': [
                    {
                      'part': part,
                      'ct': contentType,
                      's': size,
                      'cd': contentDisposition,
                      'filename': contentFilename,
                      'ci': contentId,
                      'cl': location,
                      'body': body,
                      'truncated': truncatedContent,
                      'content': {'_content': content},
                      'mp': [
                        {
                          'part': part,
                          'ct': contentType,
                          's': size,
                          'cd': contentDisposition,
                          'filename': contentFilename,
                          'ci': contentId,
                          'cl': location,
                          'body': body,
                          'truncated': truncatedContent,
                          'content': {'_content': content},
                        }
                      ],
                    }
                  ],
                  'shr': [
                    {
                      'truncated': truncatedContent,
                      'content': content,
                    }
                  ],
                  'dlSubs': [
                    {
                      'truncated': truncatedContent,
                      'content': content,
                    }
                  ],
                }
              ],
              'replies': {
                'reply': [
                  {
                    'rangeType': recurrenceRangeType,
                    'recurId': recurrenceId,
                    'seq': sequence,
                    'd': date,
                    'at': attendee,
                    'sentBy': sentBy,
                    'ptst': partStat.name,
                    'tz': timezone,
                    'ridZ': recurIdZ,
                  }
                ]
              },
              'meta': [
                {
                  'section': section,
                  '_attrs': {
                    key: value,
                  },
                }
              ],
            },
            'task': {
              'f': flags,
              't': tags,
              'tn': tagNames,
              'uid': uid,
              'id': id,
              'rev': revision,
              's': size,
              'd': date,
              'l': folder,
              'md': changeDate,
              'ms': modifiedSequence,
              'nextAlarm': nextAlarm,
              'orphan': orphan,
            },
            'c': {
              'id': id,
              'n': num,
              'u': numUnread,
              'total': totalSize,
              'f': flags,
              't': tags,
              'tn': tagNames,
              'd': date,
              'elided': elided,
              'md': changeDate,
              'ms': modifiedSequence,
              'meta': [
                {
                  'section': section,
                  '_attrs': {
                    key: value,
                  },
                }
              ],
              'su': subject,
              'fr': fragment,
              'e': [
                {
                  'a': address,
                  'd': display,
                  'p': personal,
                  't': AddressType.from.name,
                  'isGroup': isGroup,
                  'exp': canExpandGroupMembers,
                }
              ],
            },
            'w': {
              'id': id,
              'uuid': uuid,
              'name': name,
              's': size,
              'd': date,
              'l': folderId,
              'luuid': folderUuid,
              'ms': modifiedSequence,
              'mdver': metadataVersion,
              'md': changeDate,
              'rev': revision,
              'f': flags,
              't': tags,
              'tn': tagNames,
              'desc': description,
              'ct': contentType,
              'descEnabled': descEnabled,
              'ver': version,
              'leb': lastEditedBy,
              'cr': creator,
              'cd': createdDate,
              'meta': [
                {
                  'section': section,
                  '_attrs': {
                    key: value,
                  },
                }
              ],
              'fr': fragment,
              'acl': {
                'internalGrantExpiry': internalGrantExpiry,
                'guestGrantExpiry': guestGrantExpiry,
                'grant': [
                  {
                    'perm': perm,
                    'gt': GrantGranteeType.all.name,
                    'zid': granteeId,
                    'expiry': expiry,
                    'd': granteeName,
                    'pw': guestPassword,
                    'key': accessKey,
                  }
                ],
              },
            },
            'doc': {
              'loid': lockOwnerId,
              'loe': lockOwnerEmail,
              'lt': lockOwnerTimestamp,
              'id': id,
              'uuid': uuid,
              'name': name,
              's': size,
              'd': date,
              'l': folderId,
              'luuid': folderUuid,
              'ms': modifiedSequence,
              'mdver': metadataVersion,
              'md': changeDate,
              'rev': revision,
              'f': flags,
              't': tags,
              'tn': tagNames,
              'desc': description,
              'ct': contentType,
              'descEnabled': descEnabled,
              'ver': version,
              'leb': lastEditedBy,
              'cr': creator,
              'cd': createdDate,
              'meta': [
                {
                  'section': section,
                  '_attrs': {
                    key: value,
                  },
                }
              ],
              'fr': fragment,
              'acl': {
                'internalGrantExpiry': internalGrantExpiry,
                'guestGrantExpiry': guestGrantExpiry,
                'grant': [
                  {
                    'perm': perm,
                    'gt': GrantGranteeType.all.name,
                    'zid': granteeId,
                    'expiry': expiry,
                    'd': granteeName,
                    'pw': guestPassword,
                    'key': accessKey,
                  }
                ],
              },
            },
            'm': {
              'id': id,
              'autoSendTime': autoSendTime,
              'e': [
                {
                  'a': address,
                  'd': display,
                  'p': personal,
                  't': AddressType.from.name,
                  'isGroup': isGroup,
                  'exp': canExpandGroupMembers,
                }
              ],
              'su': subject,
              'fr': fragment,
              'inv': {
                'type': InviteType.appt.name,
                'tz': [
                  {
                    'id': id,
                    'stdoff': tzStdOffset,
                    'dayoff': tzDayOffset,
                    'standard': {
                      'mon': month,
                      'hour': hour,
                      'min': minute,
                      'sec': second,
                      'mday': dayOfMonth,
                      'week': week,
                      'wkday': dayOfWeek,
                    },
                    'daylight': {
                      'mon': month,
                      'hour': hour,
                      'min': minute,
                      'sec': second,
                      'mday': dayOfMonth,
                      'week': week,
                      'wkday': dayOfWeek,
                    },
                    'stdname': standardTZName,
                    'dayname': daylightTZName,
                  }
                ],
                'comp': {
                  'category': [
                    {'_content': category}
                  ],
                  'comment': [
                    {'_content': comment}
                  ],
                  'contact': [
                    {'_content': contact}
                  ],
                  'geo': {
                    'lat': latitude,
                    'lon': longitude,
                  },
                  'at': [
                    {
                      'a': address,
                      'url': url,
                      'd': displayName,
                      'sentBy': sentBy,
                      'dir': dir,
                      'lang': language,
                      'cutype': cuType,
                      'role': role,
                      'ptst': partStat.name,
                      'rsvp': rsvp,
                      'member': member,
                      'delegatedTo': delegatedTo,
                      'delegatedFrom': delegatedFrom,
                      'xparam': [
                        {
                          'name': name,
                          'value': value,
                        }
                      ],
                    }
                  ],
                  'alarm': [
                    {
                      'action': AlarmAction.display.name,
                      'trigger': {
                        'abs': {
                          'd': dateTimeString,
                        },
                        'rel': {
                          'd': dateTimeString,
                        },
                      },
                      'repeat': {
                        'neg': durationNegative,
                        'w': weeks,
                        'd': days,
                        'h': hours,
                        'm': minutes,
                        's': seconds,
                        'related': AlarmRelated.start.name,
                        'count': repeatCount,
                      },
                      'desc': {'_content': description},
                      'attach': {
                        'uri': uri,
                        'ct': contentType,
                        '_content': binaryB64Data,
                      },
                      'summary': {'_content': summary},
                      'at': [
                        {
                          'a': address,
                          'url': url,
                          'd': displayName,
                          'sentBy': sentBy,
                          'dir': dir,
                          'lang': language,
                          'cutype': cuType,
                          'role': role,
                          'ptst': partStat.name,
                          'rsvp': rsvp,
                          'member': member,
                          'delegatedTo': delegatedTo,
                          'delegatedFrom': delegatedFrom,
                          'xparam': [
                            {
                              'name': name,
                              'value': value,
                            }
                          ],
                        }
                      ],
                      'xprop': [
                        {
                          'name': name,
                          'value': value,
                          'xparam': [
                            {
                              'name': name,
                              'value': value,
                            }
                          ],
                        }
                      ],
                    }
                  ],
                  'xprop': [
                    {
                      'name': name,
                      'value': value,
                      'xparam': [
                        {
                          'name': name,
                          'value': value,
                        }
                      ],
                    }
                  ],
                  'fr': fragment,
                  'desc': {'_content': description},
                  'descHtml': {'_content': htmlDescription},
                  'or': {
                    'a': address,
                    'url': url,
                    'd': displayName,
                    'sentBy': sentBy,
                    'dir': dir,
                    'lang': language,
                    'xparam': [
                      {
                        'name': name,
                        'value': value,
                      }
                    ],
                  },
                  'recur': {
                    'add': [
                      {'add': []}
                    ],
                    'exclude': [
                      {'exclude': []}
                    ],
                    'except': [
                      {
                        'rangeType': recurrenceRangeType,
                        'recurId': recurrenceId,
                        'tz': timezone,
                        'ridZ': recurIdZ,
                        'add': {'add': []},
                        'exclude': {'exclude': []},
                      }
                    ],
                    'cancel': [
                      {
                        'rangeType': recurrenceRangeType,
                        'recurId': recurrenceId,
                        'tz': timezone,
                        'ridZ': recurIdZ,
                      }
                    ],
                    'dates': [
                      {
                        'tz': timezone,
                        'dtval': [
                          {
                            's': {
                              'd': dateTimeString,
                              'tz': timezone,
                              'u': utcTime,
                            },
                            'e': {
                              'd': dateTimeString,
                              'tz': timezone,
                              'u': utcTime,
                            },
                            'dur': {
                              'neg': durationNegative,
                              'w': weeks,
                              'd': days,
                              'h': hours,
                              'm': minutes,
                              's': seconds,
                              'related': AlarmRelated.start.name,
                              'count': repeatCount,
                            },
                          }
                        ],
                      }
                    ],
                    'rule': [
                      {
                        'freq': Frequency.second.name,
                        'until': {
                          'd': dateTimeString,
                        },
                        'count': {
                          'num': num,
                        },
                        'interval': {
                          'ival': ival,
                        },
                        'bysecond': {
                          'seclist': list,
                        },
                        'byminute': {
                          'minlist': list,
                        },
                        'byhour': {
                          'hrlist': list,
                        },
                        'byday': {
                          'wkday': [
                            {
                              'day': WeekDay.sunday.name,
                              'ordWk': ordWk,
                            }
                          ],
                        },
                        'bymonthday': {
                          'modaylist': list,
                        },
                        'byyearday': {
                          'yrdaylist': list,
                        },
                        'byweekno': {
                          'wklist': list,
                        },
                        'bymonth': {
                          'molist': list,
                        },
                        'bysetpos': {
                          'poslist': list,
                        },
                        'wkst': {
                          'day': WeekDay.sunday.name,
                        },
                        'rule-x-name': [
                          {
                            'name': name,
                            'value': value,
                          }
                        ],
                      }
                    ],
                  },
                  'exceptId': {
                    'd': dateTimeString,
                    'tz': timezone,
                    'rangeType': recurrenceRangeType,
                  },
                  's': {
                    'd': dateTimeString,
                    'tz': timezone,
                    'u': utcTime,
                  },
                  'e': {
                    'd': dateTimeString,
                    'tz': timezone,
                    'u': utcTime,
                  },
                  'dur': {
                    'neg': durationNegative,
                    'w': weeks,
                    'd': days,
                    'h': hours,
                    'm': minutes,
                    's': seconds,
                    'related': AlarmRelated.start.name,
                    'count': repeatCount,
                  },
                  'method': method,
                  'compNum': componentNum,
                  'rsvp': rsvp,
                  'priority': priority,
                  'name': name,
                  'loc': location,
                  'percentComplete': percentComplete,
                  'completed': completed,
                  'noBlob': noBlob,
                  'fba': FreeBusyStatus.free.name,
                  'fb': FreeBusyStatus.free.name,
                  'transp': Transparency.opaque.name,
                  'isOrg': isOrganizer,
                  'x_uid': xUid,
                  'uid': uid,
                  'seq': sequence,
                  'd': dateTime,
                  'calItemId': calItemId,
                  'apptId': deprecatedApptId,
                  'ciFolder': calItemFolder,
                  'status': InviteStatus.completed.name,
                  'class': InviteClass.public.name,
                  'url': url,
                  'ex': isException,
                  'ridZ': recurIdZ,
                  'allDay': isAllDay,
                  'draft': isDraft,
                  'neverSent': neverSent,
                  'changes': changes,
                },
                'replies': {
                  'reply': [
                    {
                      'rangeType': recurrenceRangeType,
                      'recurId': recurrenceId,
                      'seq': seq,
                      'd': date,
                      'at': attendee,
                      'sentBy': sentBy,
                      'ptst': partStat.name,
                      'tz': timezone,
                      'ridZ': recurIdZ,
                    }
                  ]
                },
              },
              's': size,
              'd': date,
              'l': folder,
              'cid': conversationId,
              'f': flags,
              't': tags,
              'tn': tagNames,
              'rev': revision,
              'md': changeDate,
              'ms': modifiedSequence,
              'meta': [
                {
                  'section': section,
                  '_attrs': {
                    key: value,
                  },
                }
              ],
            },
            'chat': {
              'id': id,
              'autoSendTime': autoSendTime,
              'su': subject,
              'fr': fragment,
              's': size,
              'd': date,
              'l': folder,
              'cid': conversationId,
              'f': flags,
              't': tags,
              'tn': tagNames,
              'rev': revision,
              'md': changeDate,
              'ms': modifiedSequence,
            },
          }
        }
      };
      final envelope = GetItemEnvelope.fromMap(data);
      final response = envelope.body.response as GetItemResponse;

      final folderItem = response.folderItem!;
      expect(folderItem.id, id);
      expect(folderItem.uuid, uuid);
      expect(folderItem.name, name);
      expect(folderItem.absoluteFolderPath, absoluteFolderPath);
      expect(folderItem.parentId, parentId);
      expect(folderItem.folderUuid, folderUuid);
      expect(folderItem.flags, flags);
      expect(folderItem.color, color);
      expect(folderItem.rgb, rgb);
      expect(folderItem.unreadCount, unreadCount);
      expect(folderItem.imapUnreadCount, imapUnreadCount);
      expect(folderItem.view, ViewType.conversation);
      expect(folderItem.revision, revision);
      expect(folderItem.modifiedSequence, modifiedSequence);
      expect(folderItem.changeDate, changeDate);
      expect(folderItem.itemCount, itemCount);
      expect(folderItem.imapItemCount, imapItemCount);
      expect(folderItem.totalSize, totalSize);
      expect(folderItem.imapModifiedSequence, imapModifiedSequence);
      expect(folderItem.imapUidNext, imapUidNext);
      expect(folderItem.url, url);
      expect(folderItem.activeSyncDisabled, activeSyncDisabled);
      expect(folderItem.webOfflineSyncDays, webOfflineSyncDays);
      expect(folderItem.perm, perm);
      expect(folderItem.recursive, recursive);
      expect(folderItem.restUrl, restUrl);
      expect(folderItem.deletable, deletable);

      final folderMeta = folderItem.metadatas.first;
      expect(folderMeta.section, section);
      expect(folderMeta.keyValuePairs.first.key, key);
      expect(folderMeta.keyValuePairs.first.value, value);

      final folderAcl = folderItem.acl!;
      expect(folderAcl.internalGrantExpiry, internalGrantExpiry);
      expect(folderAcl.guestGrantExpiry, guestGrantExpiry);

      final folderGrant = folderAcl.grants.first;
      expect(folderGrant.perm, perm);
      expect(folderGrant.granteeType, GrantGranteeType.all);
      expect(folderGrant.granteeId, granteeId);
      expect(folderGrant.expiry, expiry);
      expect(folderGrant.granteeName, granteeName);
      expect(folderGrant.guestPassword, guestPassword);
      expect(folderGrant.accessKey, accessKey);

      final subFolder = folderItem.subFolders.first;
      expect(subFolder.id, id);
      expect(subFolder.uuid, uuid);
      expect(subFolder.name, name);
      expect(subFolder, isA<Folder>());

      final link = folderItem.mountpoints.first;
      expect(link.id, id);
      expect(link.name, name);
      expect(link.ownerEmail, ownerEmail);
      expect(link.ownerAccountId, ownerAccountId);
      expect(link.remoteFolderId, remoteFolderId);
      expect(link.remoteUuid, remoteUuid);
      expect(link.remoteFolderName, remoteFolderName);
      expect(link.reminderEnabled, reminderEnabled);
      expect(link.broken, broken);
      expect(link, isA<Folder>());

      final search = folderItem.searchFolders.first;
      expect(search.id, id);
      expect(search.name, name);
      expect(search.query, query);
      expect(search.sortBy, SearchSortBy.none);
      expect(search.types, types);
      expect(search, isA<Folder>());

      final folderRetentionPolicy = folderItem.retentionPolicy!;
      final folderKeep = folderRetentionPolicy.keep.first;
      final folderPurge = folderRetentionPolicy.purge.first;
      expect(folderKeep.type, PolicyType.user);
      expect(folderKeep.id, id);
      expect(folderKeep.name, name);
      expect(folderKeep.lifetime, lifetime);
      expect(folderPurge.type, PolicyType.user);
      expect(folderPurge.id, id);
      expect(folderPurge.name, name);
      expect(folderPurge.lifetime, lifetime);

      final tagItem = response.tagItem!;
      expect(tagItem.id, id);
      expect(tagItem.name, name);
      expect(tagItem.color, color);
      expect(tagItem.rgb, rgb);
      expect(tagItem.unread, unread);
      expect(tagItem.count, count);
      expect(tagItem.date, date);
      expect(tagItem.revision, revision);
      expect(tagItem.changeDate, changeDate);
      expect(tagItem.modifiedSequence, modifiedSequence);

      final tagMeta = tagItem.metadatas.first;
      expect(tagMeta.section, section);
      expect(tagMeta.keyValuePairs.first.key, key);
      expect(tagMeta.keyValuePairs.first.value, value);

      final tagRetentionPolicy = tagItem.retentionPolicy!;
      final tagKeep = tagRetentionPolicy.keep.first;
      final tagPurge = tagRetentionPolicy.purge.first;
      expect(tagKeep.type, PolicyType.user);
      expect(tagKeep.id, id);
      expect(tagKeep.name, name);
      expect(tagKeep.lifetime, lifetime);
      expect(tagPurge.type, PolicyType.user);
      expect(tagPurge.id, id);
      expect(tagPurge.name, name);
      expect(tagPurge.lifetime, lifetime);

      final noteItem = response.noteItem!;
      expect(noteItem.id, id);
      expect(noteItem.revision, revision);
      expect(noteItem.folder, folder);
      expect(noteItem.date, date);
      expect(noteItem.flags, flags);
      expect(noteItem.tags, tags);
      expect(noteItem.tagNames, tagNames);
      expect(noteItem.bounds, bounds);
      expect(noteItem.color, color);
      expect(noteItem.rgb, rgb);
      expect(noteItem.changeDate, changeDate);
      expect(noteItem.modifiedSequence, modifiedSequence);
      expect(noteItem.content, content);

      final noteMeta = noteItem.metadatas.first;
      expect(noteMeta.section, section);
      expect(noteMeta.keyValuePairs.first.key, key);
      expect(noteMeta.keyValuePairs.first.value, value);

      final contactItem = response.contactItem!;
      expect(contactItem.sortField, sortField);
      expect(contactItem.canExpand, canExpand);
      expect(contactItem.id, id);
      expect(contactItem.imapUid, imapUid);
      expect(contactItem.folder, folder);
      expect(contactItem.flags, flags);
      expect(contactItem.tags, tags);
      expect(contactItem.tagNames, tagNames);
      expect(contactItem.changeDate, changeDate);
      expect(contactItem.modifiedSequenceId, modifiedSequenceId);
      expect(contactItem.date, date);
      expect(contactItem.revisionId, revisionId);
      expect(contactItem.fileAs, fileAs);
      expect(contactItem.email, email);
      expect(contactItem.email2, email2);
      expect(contactItem.email3, email3);
      expect(contactItem.type, type);
      expect(contactItem.dlist, dlist);
      expect(contactItem.reference, reference);
      expect(contactItem.tooManyMembers, tooManyMembers);
      expect(contactItem.memberOf, memberOf);

      final contactMeta = contactItem.metadatas.first;
      expect(contactMeta.section, section);
      expect(contactMeta.keyValuePairs.first.key, key);
      expect(contactMeta.keyValuePairs.first.value, value);

      final contactAttr = contactItem.attrs.first;
      expect(contactAttr.key, key);
      expect(contactAttr.value, value);
      // expect(contactAttr.part, part);
      // expect(contactAttr.contentType, contentType);
      // expect(contactAttr.size, size);
      // expect(contactAttr.contentFilename, contentFilename);

      final contactMember = contactItem.contactGroupMembers.first;
      expect(contactMember.type, MemberType.contact);
      expect(contactMember.value, value);

      final cn = contactMember.contact!;
      expect(cn.sortField, sortField);
      expect(cn.canExpand, canExpand);
      expect(cn.id, id);
      expect(cn.imapUid, imapUid);
      expect(cn.folder, folder);
      expect(cn.flags, flags);
      expect(cn.tags, tags);
      expect(cn.tagNames, tagNames);
      expect(cn.changeDate, changeDate);
      expect(cn.modifiedSequenceId, modifiedSequenceId);
      expect(cn.date, date);
      expect(cn.revisionId, revisionId);
      expect(cn.fileAs, fileAs);
      expect(cn.email, email);
      expect(cn.email2, email2);
      expect(cn.email3, email3);
      expect(cn.type, type);
      expect(cn.dlist, dlist);
      expect(cn.reference, reference);
      expect(cn.tooManyMembers, tooManyMembers);
      expect(cn.memberOf, memberOf);

      final apptItem = response.apptItem!;
      expect(apptItem.flags, flags);
      expect(apptItem.tags, tags);
      expect(apptItem.tagNames, tagNames);
      expect(apptItem.uid, uid);
      expect(apptItem.id, id);
      expect(apptItem.revision, revision);
      expect(apptItem.size, size);
      expect(apptItem.date, date);
      expect(apptItem.folder, folder);
      expect(apptItem.changeDate, changeDate);
      expect(apptItem.modifiedSequence, modifiedSequence);
      expect(apptItem.nextAlarm, nextAlarm);
      expect(apptItem.orphan, orphan);

      final inv = apptItem.invites.first;
      expect(inv.calItemType, InviteType.appt);
      expect(inv.sequence, sequence);
      expect(inv.id, id);
      expect(inv.componentNum, componentNum);
      expect(inv.recurrenceId, recurrenceId);

      final invTz = inv.timezones.first;
      expect(invTz.id, id);
      expect(invTz.tzStdOffset, tzStdOffset);
      expect(invTz.tzDayOffset, tzDayOffset);
      expect(invTz.standardTZName, standardTZName);
      expect(invTz.daylightTZName, daylightTZName);

      final invTzStandard = invTz.standardTzOnset!;
      expect(invTzStandard.month, month);
      expect(invTzStandard.hour, hour);
      expect(invTzStandard.minute, minute);
      expect(invTzStandard.second, second);
      expect(invTzStandard.dayOfMonth, dayOfMonth);
      expect(invTzStandard.week, week);
      expect(invTzStandard.dayOfWeek, dayOfWeek);

      final invTzDaylight = invTz.daylightTzOnset!;
      expect(invTzDaylight.month, month);
      expect(invTzDaylight.hour, hour);
      expect(invTzDaylight.minute, minute);
      expect(invTzDaylight.second, second);
      expect(invTzDaylight.dayOfMonth, dayOfMonth);
      expect(invTzDaylight.week, week);
      expect(invTzDaylight.dayOfWeek, dayOfWeek);

      final partInfo = inv.partInfos.first;
      expect(partInfo.part, part);
      expect(partInfo.contentType, contentType);
      expect(partInfo.size, size);
      expect(partInfo.contentDisposition, contentDisposition);
      expect(partInfo.contentFilename, contentFilename);
      expect(partInfo.contentId, contentId);
      expect(partInfo.location, location);
      expect(partInfo.body, body);
      expect(partInfo.truncatedContent, truncatedContent);
      expect(partInfo.content, content);
      expect(partInfo.body, body);
      final mpPartInfo = partInfo.mimeParts.first;
      expect(mpPartInfo.part, part);
      expect(mpPartInfo.contentType, contentType);
      expect(mpPartInfo.size, size);
      expect(mpPartInfo.contentDisposition, contentDisposition);
      expect(mpPartInfo.contentFilename, contentFilename);
      expect(mpPartInfo.contentId, contentId);
      expect(mpPartInfo.location, location);
      expect(mpPartInfo.body, body);
      expect(mpPartInfo.truncatedContent, truncatedContent);
      expect(mpPartInfo.content, content);
      expect(mpPartInfo.body, body);

      final shr = inv.shareNotifications.first;
      expect(shr.truncatedContent, truncatedContent);
      expect(shr.content, content);

      final dlSubs = inv.dlSubsNotifications.first;
      expect(dlSubs.truncatedContent, truncatedContent);
      expect(dlSubs.content, content);

      final comp = inv.inviteComponent!;
      expect(comp.method, method);
      expect(comp.componentNum, componentNum);
      expect(comp.rsvp, rsvp);
      expect(comp.priority, priority);
      expect(comp.name, name);
      expect(comp.location, location);
      expect(comp.percentComplete, percentComplete);
      expect(comp.completed, completed);
      expect(comp.noBlob, noBlob);
      expect(comp.freeBusyActual, FreeBusyStatus.free);
      expect(comp.freeBusy, FreeBusyStatus.free);
      expect(comp.transparency, Transparency.opaque);
      expect(comp.isOrganizer, isOrganizer);
      expect(comp.xUid, xUid);
      expect(comp.uid, uid);
      expect(comp.sequence, sequence);
      expect(comp.dateTime, dateTime);
      expect(comp.calItemId, calItemId);
      expect(comp.deprecatedApptId, deprecatedApptId);
      expect(comp.calItemFolder, calItemFolder);
      expect(comp.status, InviteStatus.completed);
      expect(comp.calClass, InviteClass.public);
      expect(comp.url, url);
      expect(comp.isException, isException);
      expect(comp.recurIdZ, recurIdZ);
      expect(comp.isAllDay, isAllDay);
      expect(comp.isDraft, isDraft);
      expect(comp.neverSent, neverSent);
      expect(comp.changes, changes);

      expect(comp.fragment, fragment);
      expect(comp.description, description);
      expect(comp.htmlDescription, htmlDescription);

      expect(comp.categories.first, category);
      expect(comp.comments.first, comment);
      expect(comp.contacts.first, contact);

      final geo = comp.geo!;
      expect(geo.latitude, latitude);
      expect(geo.longitude, longitude);

      final compAt = comp.attendees.first;
      expect(compAt.address, address);
      expect(compAt.url, url);
      expect(compAt.displayName, displayName);
      expect(compAt.sentBy, sentBy);
      expect(compAt.dir, dir);
      expect(compAt.language, language);
      expect(compAt.cuType, cuType);
      expect(compAt.role, role);
      expect(compAt.partStat, partStat);
      expect(compAt.rsvp, rsvp);
      expect(compAt.member, member);
      expect(compAt.delegatedTo, delegatedTo);
      expect(compAt.delegatedFrom, delegatedFrom);
      expect(compAt.xParams.first.name, name);
      expect(compAt.xParams.first.value, value);

      final alarm = comp.alarms.first;
      expect(alarm.action, AlarmAction.display);
      expect(alarm.description, description);
      expect(alarm.summary, summary);
      expect(alarm.attach!.uri, uri);
      expect(alarm.attach!.contentType, contentType);
      expect(alarm.attach!.binaryB64Data, binaryB64Data);

      final alarmAt = alarm.attendees.first;
      expect(alarmAt.address, address);
      expect(alarmAt.url, url);
      expect(alarmAt.displayName, displayName);
      expect(alarmAt.sentBy, sentBy);
      expect(alarmAt.dir, dir);
      expect(alarmAt.language, language);
      expect(alarmAt.cuType, cuType);
      expect(alarmAt.role, role);
      expect(alarmAt.partStat, partStat);
      expect(alarmAt.rsvp, rsvp);
      expect(alarmAt.member, member);
      expect(alarmAt.delegatedTo, delegatedTo);
      expect(alarmAt.delegatedFrom, delegatedFrom);
      expect(alarmAt.xParams.first.name, name);
      expect(alarmAt.xParams.first.value, value);

      final alarmXProp = alarm.xProps.first;
      expect(alarmXProp.name, name);
      expect(alarmXProp.value, value);
      expect(alarmXProp.xParams.first.name, name);
      expect(alarmXProp.xParams.first.value, value);

      final compXProp = comp.xProps.first;
      expect(compXProp.name, name);
      expect(compXProp.value, value);
      expect(compXProp.xParams.first.name, name);
      expect(compXProp.xParams.first.value, value);

      final organizer = comp.organizer!;
      expect(organizer.address, address);
      expect(organizer.url, url);
      expect(organizer.displayName, displayName);
      expect(organizer.sentBy, sentBy);
      expect(organizer.dir, dir);
      expect(organizer.language, language);
      expect(organizer.xParams.first.name, name);
      expect(organizer.xParams.first.value, value);

      final recurrence = comp.recurrence!;
      expect(recurrence.add.first, isA<AddRecurrenceInfo>());
      expect(recurrence.exclude.first, isA<ExcludeRecurrenceInfo>());

      final except = recurrence.except.first;
      expect(except.recurrenceRangeType, recurrenceRangeType);
      expect(except.recurrenceId, recurrenceId);
      expect(except.timezone, timezone);
      expect(except.recurIdZ, recurIdZ);
      expect(except.add, isA<RecurrenceInfo>());
      expect(except.exclude, isA<RecurrenceInfo>());

      final cancel = recurrence.cancel.first;
      expect(cancel.recurrenceRangeType, recurrenceRangeType);
      expect(cancel.recurrenceId, recurrenceId);
      expect(cancel.timezone, timezone);
      expect(cancel.recurIdZ, recurIdZ);

      final dates = recurrence.dates.first;
      expect(dates.timezone, timezone);

      final startTime = dates.dtVals.first.startTime!;
      expect(startTime.dateTime, dateTimeString);
      expect(startTime.timezone, timezone);
      expect(startTime.utcTime, utcTime);

      final endTime = dates.dtVals.first.endTime!;
      expect(endTime.dateTime, dateTimeString);
      expect(endTime.timezone, timezone);
      expect(endTime.utcTime, utcTime);

      final duration = dates.dtVals.first.duration!;
      expect(duration.durationNegative, durationNegative);
      expect(duration.weeks, weeks);
      expect(duration.days, days);
      expect(duration.hours, hours);
      expect(duration.minutes, minutes);
      expect(duration.seconds, seconds);
      expect(duration.related, AlarmRelated.start);
      expect(duration.repeatCount, repeatCount);

      final simple = recurrence.simple.first;
      expect(simple.until!.dateTime, dateTimeString);
      expect(simple.count!.num, num);
      expect(simple.interval!.ival, ival);
      expect(simple.bySecond!.list, list);
      expect(simple.byMinute!.list, list);
      expect(simple.byHour!.list, list);
      expect(simple.byDay!.days.first.day, WeekDay.sunday);
      expect(simple.byDay!.days.first.ordWk, ordWk);
      expect(simple.byMonthDay!.list, list);
      expect(simple.byYearDay!.list, list);
      expect(simple.byWeekNo!.list, list);
      expect(simple.byMonth!.list, list);
      expect(simple.bySetPose!.list, list);
      expect(simple.weekStart!.day, WeekDay.sunday);
      expect(simple.xNames.first.name, name);
      expect(simple.xNames.first.value, value);

      final exceptionId = comp.exceptionId!;
      expect(exceptionId.dateTime, dateTimeString);
      expect(exceptionId.timezone, timezone);
      expect(exceptionId.recurrenceRangeType, recurrenceRangeType);

      final dtStart = comp.dtStart!;
      expect(dtStart.dateTime, dateTimeString);
      expect(dtStart.timezone, timezone);
      expect(dtStart.utcTime, utcTime);

      final dtEnd = comp.dtEnd!;
      expect(dtEnd.dateTime, dateTimeString);
      expect(dtEnd.timezone, timezone);
      expect(dtEnd.utcTime, utcTime);

      final inviteDuration = comp.duration!;
      expect(inviteDuration.durationNegative, durationNegative);
      expect(inviteDuration.weeks, weeks);
      expect(inviteDuration.days, days);
      expect(inviteDuration.hours, hours);
      expect(inviteDuration.minutes, minutes);
      expect(inviteDuration.seconds, seconds);
      expect(inviteDuration.related, AlarmRelated.start);
      expect(inviteDuration.repeatCount, repeatCount);

      final apptReply = apptItem.calendarReplies.first;
      expect(apptReply.recurrenceRangeType, recurrenceRangeType);
      expect(apptReply.recurrenceId, recurrenceId);
      expect(apptReply.seq, sequence);
      expect(apptReply.date, date);
      expect(apptReply.attendee, attendee);
      expect(apptReply.sentBy, sentBy);
      expect(apptReply.partStat, partStat);
      expect(apptReply.timezone, timezone);
      expect(apptReply.recurIdZ, recurIdZ);

      final apptMeta = apptItem.metadatas.first;
      expect(apptMeta.section, section);
      expect(apptMeta.keyValuePairs.first.key, key);
      expect(apptMeta.keyValuePairs.first.value, value);

      final taskItem = response.taskItem!;
      expect(taskItem, isA<TaskItemInfo>());
      expect(taskItem, isA<CalendarItemInfo>());
      expect(taskItem.flags, flags);
      expect(taskItem.tags, tags);
      expect(taskItem.tagNames, tagNames);
      expect(taskItem.uid, uid);
      expect(taskItem.id, id);
      expect(taskItem.revision, revision);
      expect(taskItem.size, size);
      expect(taskItem.date, date);
      expect(taskItem.folder, folder);
      expect(taskItem.changeDate, changeDate);
      expect(taskItem.modifiedSequence, modifiedSequence);
      expect(taskItem.nextAlarm, nextAlarm);
      expect(taskItem.orphan, orphan);

      final convItem = response.convItem!;
      expect(convItem.id, id);
      expect(convItem.numMsg, num);
      expect(convItem.numUnread, numUnread);
      expect(convItem.totalSize, totalSize);
      expect(convItem.flags, flags);
      expect(convItem.tags, tags);
      expect(convItem.tagNames, tagNames);
      expect(convItem.date, date);
      expect(convItem.elided, elided);
      expect(convItem.changeDate, changeDate);
      expect(convItem.modifiedSequence, modifiedSequence);
      expect(convItem.subject, subject);
      expect(convItem.fragment, fragment);

      final convMeta = convItem.metadatas.first;
      expect(convMeta.section, section);
      expect(convMeta.keyValuePairs.first.key, key);
      expect(convMeta.keyValuePairs.first.value, value);

      final convEmail = convItem.emails.first;
      expect(convEmail.address, address);
      expect(convEmail.display, display);
      expect(convEmail.personal, personal);
      expect(convEmail.addressType, AddressType.from);
      expect(convEmail.isGroup, isGroup);
      expect(convEmail.canExpandGroupMembers, canExpandGroupMembers);

      final wikiItem = response.wikiItem!;
      expect(wikiItem.id, id);
      expect(wikiItem.uuid, uuid);
      expect(wikiItem.name, name);
      expect(wikiItem.size, size);
      expect(wikiItem.date, date);
      expect(wikiItem.folderId, folderId);
      expect(wikiItem.folderUuid, folderUuid);
      expect(wikiItem.modifiedSequence, modifiedSequence);
      expect(wikiItem.metadataVersion, metadataVersion);
      expect(wikiItem.changeDate, changeDate);
      expect(wikiItem.revision, revision);
      expect(wikiItem.flags, flags);
      expect(wikiItem.tags, tags);
      expect(wikiItem.tagNames, tagNames);
      expect(wikiItem.description, description);
      expect(wikiItem.contentType, contentType);
      expect(wikiItem.descEnabled, descEnabled);
      expect(wikiItem.version, version);
      expect(wikiItem.lastEditedBy, lastEditedBy);
      expect(wikiItem.creator, creator);
      expect(wikiItem.createdDate, createdDate);
      expect(wikiItem.fragment, fragment);

      final wikiMeta = wikiItem.metadatas.first;
      expect(wikiMeta.section, section);
      expect(wikiMeta.keyValuePairs.first.key, key);
      expect(wikiMeta.keyValuePairs.first.value, value);

      final wikiAcl = wikiItem.acl!;
      expect(wikiAcl.internalGrantExpiry, internalGrantExpiry);
      expect(wikiAcl.guestGrantExpiry, guestGrantExpiry);

      final wikiGrant = wikiAcl.grants.first;
      expect(wikiGrant.perm, perm);
      expect(wikiGrant.granteeType, GrantGranteeType.all);
      expect(wikiGrant.granteeId, granteeId);
      expect(wikiGrant.expiry, expiry);
      expect(wikiGrant.granteeName, granteeName);
      expect(wikiGrant.guestPassword, guestPassword);
      expect(wikiGrant.accessKey, accessKey);

      final docItem = response.docItem!;
      expect(docItem.lockOwnerId, lockOwnerId);
      expect(docItem.lockOwnerEmail, lockOwnerEmail);
      expect(docItem.lockOwnerTimestamp, lockOwnerTimestamp);
      expect(docItem.id, id);
      expect(docItem.uuid, uuid);
      expect(docItem.name, name);
      expect(docItem.size, size);
      expect(docItem.date, date);
      expect(docItem.folderId, folderId);
      expect(docItem.folderUuid, folderUuid);
      expect(docItem.modifiedSequence, modifiedSequence);
      expect(docItem.metadataVersion, metadataVersion);
      expect(docItem.changeDate, changeDate);
      expect(docItem.revision, revision);
      expect(docItem.flags, flags);
      expect(docItem.tags, tags);
      expect(docItem.tagNames, tagNames);
      expect(docItem.description, description);
      expect(docItem.contentType, contentType);
      expect(docItem.descEnabled, descEnabled);
      expect(docItem.version, version);
      expect(docItem.lastEditedBy, lastEditedBy);
      expect(docItem.creator, creator);
      expect(docItem.createdDate, createdDate);
      expect(docItem.fragment, fragment);

      final docMeta = docItem.metadatas.first;
      expect(docMeta.section, section);
      expect(docMeta.keyValuePairs.first.key, key);
      expect(docMeta.keyValuePairs.first.value, value);

      final docAcl = docItem.acl!;
      expect(docAcl.internalGrantExpiry, internalGrantExpiry);
      expect(docAcl.guestGrantExpiry, guestGrantExpiry);

      final docGrant = docAcl.grants.first;
      expect(docGrant.perm, perm);
      expect(docGrant.granteeType, GrantGranteeType.all);
      expect(docGrant.granteeId, granteeId);
      expect(docGrant.expiry, expiry);
      expect(docGrant.granteeName, granteeName);
      expect(docGrant.guestPassword, guestPassword);
      expect(docGrant.accessKey, accessKey);

      final msgItem = response.msgItem!;

      expect(msgItem.id, id);
      expect(msgItem.autoSendTime, autoSendTime);
      expect(msgItem.subject, subject);
      expect(msgItem.fragment, fragment);
      expect(msgItem.size, size);
      expect(msgItem.date, date);
      expect(msgItem.folder, folder);
      expect(msgItem.conversationId, conversationId);
      expect(msgItem.flags, flags);
      expect(msgItem.tags, tags);
      expect(msgItem.tagNames, tagNames);
      expect(msgItem.revision, revision);
      expect(msgItem.changeDate, changeDate);
      expect(msgItem.modifiedSequence, modifiedSequence);

      final msgEmail = msgItem.emails.first;
      expect(msgEmail.address, address);
      expect(msgEmail.display, display);
      expect(msgEmail.personal, personal);
      expect(msgEmail.addressType, AddressType.from);
      expect(msgEmail.isGroup, isGroup);
      expect(msgEmail.canExpandGroupMembers, canExpandGroupMembers);

      final msgMeta = msgItem.metadatas.first;
      expect(msgMeta.section, section);
      expect(msgMeta.keyValuePairs.first.key, key);
      expect(msgMeta.keyValuePairs.first.value, value);

      final msgInvite = msgItem.invite!;
      expect(msgInvite.calItemType, InviteType.appt);

      final msgTz = msgInvite.timezones.first;
      expect(msgTz.id, id);
      expect(msgTz.tzStdOffset, tzStdOffset);
      expect(msgTz.tzDayOffset, tzDayOffset);
      expect(msgTz.standardTZName, standardTZName);
      expect(msgTz.daylightTZName, daylightTZName);

      final msgStandardTzOnset = msgTz.standardTzOnset!;
      expect(msgStandardTzOnset.month, month);
      expect(msgStandardTzOnset.hour, hour);
      expect(msgStandardTzOnset.minute, minute);
      expect(msgStandardTzOnset.second, second);
      expect(msgStandardTzOnset.dayOfMonth, dayOfMonth);
      expect(msgStandardTzOnset.week, week);
      expect(msgStandardTzOnset.dayOfWeek, dayOfWeek);

      final msgDaylightTzOnset = msgTz.daylightTzOnset!;
      expect(msgDaylightTzOnset.month, month);
      expect(msgDaylightTzOnset.hour, hour);
      expect(msgDaylightTzOnset.minute, minute);
      expect(msgDaylightTzOnset.second, second);
      expect(msgDaylightTzOnset.dayOfMonth, dayOfMonth);
      expect(msgDaylightTzOnset.week, week);
      expect(msgDaylightTzOnset.dayOfWeek, dayOfWeek);

      final msgReply = msgInvite.calendarReplies.first;
      expect(msgReply.recurrenceRangeType, recurrenceRangeType);
      expect(msgReply.recurrenceId, recurrenceId);
      expect(msgReply.seq, seq);
      expect(msgReply.date, date);
      expect(msgReply.attendee, attendee);
      expect(msgReply.sentBy, sentBy);
      expect(msgReply.partStat, partStat);
      expect(msgReply.timezone, timezone);
      expect(msgReply.recurIdZ, recurIdZ);

      final msgInviteComponent = msgInvite.inviteComponent!;

      expect(msgInviteComponent.method, method);
      expect(msgInviteComponent.componentNum, componentNum);
      expect(msgInviteComponent.rsvp, rsvp);
      expect(msgInviteComponent.priority, priority);
      expect(msgInviteComponent.name, name);
      expect(msgInviteComponent.location, location);
      expect(msgInviteComponent.percentComplete, percentComplete);
      expect(msgInviteComponent.completed, completed);
      expect(msgInviteComponent.noBlob, noBlob);
      expect(msgInviteComponent.freeBusyActual, FreeBusyStatus.free);
      expect(msgInviteComponent.freeBusy, FreeBusyStatus.free);
      expect(msgInviteComponent.transparency, Transparency.opaque);
      expect(msgInviteComponent.isOrganizer, isOrganizer);
      expect(msgInviteComponent.xUid, xUid);
      expect(msgInviteComponent.uid, uid);
      expect(msgInviteComponent.sequence, sequence);
      expect(msgInviteComponent.dateTime, dateTime);
      expect(msgInviteComponent.calItemId, calItemId);
      expect(msgInviteComponent.deprecatedApptId, deprecatedApptId);
      expect(msgInviteComponent.calItemFolder, calItemFolder);
      expect(msgInviteComponent.status, InviteStatus.completed);
      expect(msgInviteComponent.calClass, InviteClass.public);
      expect(msgInviteComponent.url, url);
      expect(msgInviteComponent.isException, isException);
      expect(msgInviteComponent.recurIdZ, recurIdZ);
      expect(msgInviteComponent.isAllDay, isAllDay);
      expect(msgInviteComponent.isDraft, isDraft);
      expect(msgInviteComponent.neverSent, neverSent);
      expect(msgInviteComponent.changes, changes);

      expect(msgInviteComponent.fragment, fragment);
      expect(msgInviteComponent.description, description);
      expect(msgInviteComponent.htmlDescription, htmlDescription);

      expect(msgInviteComponent.categories.first, category);
      expect(msgInviteComponent.comments.first, comment);
      expect(msgInviteComponent.contacts.first, contact);

      final msgGeo = msgInviteComponent.geo!;
      expect(msgGeo.latitude, latitude);
      expect(msgGeo.longitude, longitude);

      final inviteAt = msgInviteComponent.attendees.first;
      expect(inviteAt.address, address);
      expect(inviteAt.url, url);
      expect(inviteAt.displayName, displayName);
      expect(inviteAt.sentBy, sentBy);
      expect(inviteAt.dir, dir);
      expect(inviteAt.language, language);
      expect(inviteAt.cuType, cuType);
      expect(inviteAt.role, role);
      expect(inviteAt.partStat, partStat);
      expect(inviteAt.rsvp, rsvp);
      expect(inviteAt.member, member);
      expect(inviteAt.delegatedTo, delegatedTo);
      expect(inviteAt.delegatedFrom, delegatedFrom);
      expect(inviteAt.xParams.first.name, name);
      expect(inviteAt.xParams.first.value, value);

      final msgAlarm = msgInviteComponent.alarms.first;
      expect(msgAlarm.action, AlarmAction.display);
      expect(msgAlarm.description, description);
      expect(msgAlarm.summary, summary);
      expect(msgAlarm.attach!.uri, uri);
      expect(msgAlarm.attach!.contentType, contentType);
      expect(msgAlarm.attach!.binaryB64Data, binaryB64Data);

      final msgAlarmAt = msgAlarm.attendees.first;
      expect(msgAlarmAt.address, address);
      expect(msgAlarmAt.url, url);
      expect(msgAlarmAt.displayName, displayName);
      expect(msgAlarmAt.sentBy, sentBy);
      expect(msgAlarmAt.dir, dir);
      expect(msgAlarmAt.language, language);
      expect(msgAlarmAt.cuType, cuType);
      expect(msgAlarmAt.role, role);
      expect(msgAlarmAt.partStat, partStat);
      expect(msgAlarmAt.rsvp, rsvp);
      expect(msgAlarmAt.member, member);
      expect(msgAlarmAt.delegatedTo, delegatedTo);
      expect(msgAlarmAt.delegatedFrom, delegatedFrom);
      expect(msgAlarmAt.xParams.first.name, name);
      expect(msgAlarmAt.xParams.first.value, value);

      final msgAlarmXProp = msgAlarm.xProps.first;
      expect(msgAlarmXProp.name, name);
      expect(msgAlarmXProp.value, value);
      expect(msgAlarmXProp.xParams.first.name, name);
      expect(msgAlarmXProp.xParams.first.value, value);

      final msgInviteXProp = msgInviteComponent.xProps.first;
      expect(msgInviteXProp.name, name);
      expect(msgInviteXProp.value, value);
      expect(msgInviteXProp.xParams.first.name, name);
      expect(msgInviteXProp.xParams.first.value, value);

      final msgOrganizer = msgInviteComponent.organizer!;
      expect(msgOrganizer.address, address);
      expect(msgOrganizer.url, url);
      expect(msgOrganizer.displayName, displayName);
      expect(msgOrganizer.sentBy, sentBy);
      expect(msgOrganizer.dir, dir);
      expect(msgOrganizer.language, language);
      expect(msgOrganizer.xParams.first.name, name);
      expect(msgOrganizer.xParams.first.value, value);

      final msgRecurrence = msgInviteComponent.recurrence!;
      expect(msgRecurrence.add.first, isA<AddRecurrenceInfo>());
      expect(msgRecurrence.exclude.first, isA<ExcludeRecurrenceInfo>());

      final msgExcept = msgRecurrence.except.first;
      expect(msgExcept.recurrenceRangeType, recurrenceRangeType);
      expect(msgExcept.recurrenceId, recurrenceId);
      expect(msgExcept.timezone, timezone);
      expect(msgExcept.recurIdZ, recurIdZ);
      expect(msgExcept.add, isA<RecurrenceInfo>());
      expect(msgExcept.exclude, isA<RecurrenceInfo>());

      final msgCancel = msgRecurrence.cancel.first;
      expect(msgCancel.recurrenceRangeType, recurrenceRangeType);
      expect(msgCancel.recurrenceId, recurrenceId);
      expect(msgCancel.timezone, timezone);
      expect(msgCancel.recurIdZ, recurIdZ);

      final msgDates = msgRecurrence.dates.first;
      expect(dates.timezone, timezone);

      final msgStartTime = msgDates.dtVals.first.startTime!;
      expect(msgStartTime.dateTime, dateTimeString);
      expect(msgStartTime.timezone, timezone);
      expect(msgStartTime.utcTime, utcTime);

      final msgEndTime = msgDates.dtVals.first.endTime!;
      expect(msgEndTime.dateTime, dateTimeString);
      expect(msgEndTime.timezone, timezone);
      expect(msgEndTime.utcTime, utcTime);

      final msgDuration = msgDates.dtVals.first.duration!;
      expect(msgDuration.durationNegative, durationNegative);
      expect(msgDuration.weeks, weeks);
      expect(msgDuration.days, days);
      expect(msgDuration.hours, hours);
      expect(msgDuration.minutes, minutes);
      expect(msgDuration.seconds, seconds);
      expect(msgDuration.related, AlarmRelated.start);
      expect(msgDuration.repeatCount, repeatCount);

      final msgSimple = msgRecurrence.simple.first;
      expect(msgSimple.until!.dateTime, dateTimeString);
      expect(msgSimple.count!.num, num);
      expect(msgSimple.interval!.ival, ival);
      expect(msgSimple.bySecond!.list, list);
      expect(msgSimple.byMinute!.list, list);
      expect(msgSimple.byHour!.list, list);
      expect(msgSimple.byDay!.days.first.day, WeekDay.sunday);
      expect(msgSimple.byDay!.days.first.ordWk, ordWk);
      expect(msgSimple.byMonthDay!.list, list);
      expect(msgSimple.byYearDay!.list, list);
      expect(msgSimple.byWeekNo!.list, list);
      expect(msgSimple.byMonth!.list, list);
      expect(msgSimple.bySetPose!.list, list);
      expect(msgSimple.weekStart!.day, WeekDay.sunday);
      expect(msgSimple.xNames.first.name, name);
      expect(msgSimple.xNames.first.value, value);

      final msgExceptionId = msgInviteComponent.exceptionId!;
      expect(msgExceptionId.dateTime, dateTimeString);
      expect(msgExceptionId.timezone, timezone);
      expect(msgExceptionId.recurrenceRangeType, recurrenceRangeType);

      final msgDtStart = msgInviteComponent.dtStart!;
      expect(msgDtStart.dateTime, dateTimeString);
      expect(msgDtStart.timezone, timezone);
      expect(msgDtStart.utcTime, utcTime);

      final msgDtEnd = msgInviteComponent.dtEnd!;
      expect(msgDtEnd.dateTime, dateTimeString);
      expect(msgDtEnd.timezone, timezone);
      expect(msgDtEnd.utcTime, utcTime);

      final msgInviteDuration = msgInviteComponent.duration!;
      expect(msgInviteDuration.durationNegative, durationNegative);
      expect(msgInviteDuration.weeks, weeks);
      expect(msgInviteDuration.days, days);
      expect(msgInviteDuration.hours, hours);
      expect(msgInviteDuration.minutes, minutes);
      expect(msgInviteDuration.seconds, seconds);
      expect(msgInviteDuration.related, AlarmRelated.start);
      expect(msgInviteDuration.repeatCount, repeatCount);

      final chatItem = response.chatItem!;
      expect(chatItem, isA<MessageSummary>());
      expect(chatItem, isA<ChatSummary>());
      expect(chatItem.id, id);
      expect(chatItem.autoSendTime, autoSendTime);
      expect(chatItem.subject, subject);
      expect(chatItem.fragment, fragment);
      expect(chatItem.size, size);
      expect(chatItem.date, date);
      expect(chatItem.folder, folder);
      expect(chatItem.conversationId, conversationId);
      expect(chatItem.flags, flags);
      expect(chatItem.tags, tags);
      expect(chatItem.tagNames, tagNames);
      expect(chatItem.revision, revision);
      expect(chatItem.changeDate, changeDate);
      expect(chatItem.modifiedSequence, modifiedSequence);
    }));
  }));
}
