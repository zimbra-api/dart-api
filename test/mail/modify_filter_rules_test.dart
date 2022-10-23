import 'package:faker/faker.dart';
import 'package:test/test.dart';
import 'package:zimbra_api/src/common/enum/address_part.dart';
import 'package:zimbra_api/src/common/enum/comparison_comparator.dart';
import 'package:zimbra_api/src/common/enum/count_comparison.dart';
import 'package:zimbra_api/src/common/enum/date_comparison.dart';
import 'package:zimbra_api/src/common/enum/filter_condition.dart';
import 'package:zimbra_api/src/common/enum/filter_flag_name.dart';
import 'package:zimbra_api/src/common/enum/importance.dart';
import 'package:zimbra_api/src/common/enum/logging_level.dart';
import 'package:zimbra_api/src/common/enum/match_type.dart';
import 'package:zimbra_api/src/common/enum/number_comparison.dart';
import 'package:zimbra_api/src/common/enum/relational_comparator.dart';
import 'package:zimbra_api/src/common/enum/string_comparison.dart';
import 'package:zimbra_api/src/common/enum/value_comparison.dart';
import 'package:zimbra_api/src/common/enum/where_setting.dart';
import 'package:zimbra_api/src/mail/message/modify_filter_rules_envelope.dart';
import 'package:zimbra_api/src/mail/message/modify_filter_rules_request.dart';
import 'package:zimbra_api/src/mail/message/modify_filter_rules_response.dart';
import 'package:zimbra_api/src/mail/type/addheader_action.dart';
import 'package:zimbra_api/src/mail/type/address_book_test.dart';
import 'package:zimbra_api/src/mail/type/address_test.dart';
import 'package:zimbra_api/src/mail/type/attachment_test.dart';
import 'package:zimbra_api/src/mail/type/body_test.dart';
import 'package:zimbra_api/src/mail/type/bulk_test.dart';
import 'package:zimbra_api/src/mail/type/community_connections_test.dart';
import 'package:zimbra_api/src/mail/type/community_content_test.dart';
import 'package:zimbra_api/src/mail/type/community_requests_test.dart';
import 'package:zimbra_api/src/mail/type/contact_ranking_test.dart';
import 'package:zimbra_api/src/mail/type/conversation_test.dart';
import 'package:zimbra_api/src/mail/type/current_day_of_week_test.dart';
import 'package:zimbra_api/src/mail/type/current_time_test.dart';
import 'package:zimbra_api/src/mail/type/date_test.dart';
import 'package:zimbra_api/src/mail/type/deleteheader_action.dart';
import 'package:zimbra_api/src/mail/type/discard_action.dart';
import 'package:zimbra_api/src/mail/type/editheader_test.dart';
import 'package:zimbra_api/src/mail/type/envelope_test.dart';
import 'package:zimbra_api/src/mail/type/ereject_action.dart';
import 'package:zimbra_api/src/mail/type/facebook_test.dart';
import 'package:zimbra_api/src/mail/type/file_into_action.dart';
import 'package:zimbra_api/src/mail/type/filter_actions.dart';
import 'package:zimbra_api/src/mail/type/filter_rule.dart';
import 'package:zimbra_api/src/mail/type/filter_tests.dart';
import 'package:zimbra_api/src/mail/type/filter_variable.dart';
import 'package:zimbra_api/src/mail/type/filter_variables.dart';
import 'package:zimbra_api/src/mail/type/flag_action.dart';
import 'package:zimbra_api/src/mail/type/flagged_test.dart';
import 'package:zimbra_api/src/mail/type/header_exists_test.dart';
import 'package:zimbra_api/src/mail/type/header_test.dart';
import 'package:zimbra_api/src/mail/type/importance_test.dart';
import 'package:zimbra_api/src/mail/type/invite_test.dart';
import 'package:zimbra_api/src/mail/type/keep_action.dart';
import 'package:zimbra_api/src/mail/type/linkedin_test.dart';
import 'package:zimbra_api/src/mail/type/list_test.dart';
import 'package:zimbra_api/src/mail/type/log_action.dart';
import 'package:zimbra_api/src/mail/type/me_test.dart';
import 'package:zimbra_api/src/mail/type/mime_header_test.dart';
import 'package:zimbra_api/src/mail/type/nested_rule.dart';
import 'package:zimbra_api/src/mail/type/notify_action.dart';
import 'package:zimbra_api/src/mail/type/redirect_action.dart';
import 'package:zimbra_api/src/mail/type/reject_action.dart';
import 'package:zimbra_api/src/mail/type/replaceheader_action.dart';
import 'package:zimbra_api/src/mail/type/reply_action.dart';
import 'package:zimbra_api/src/mail/type/rfc_compliant_notify_action.dart';
import 'package:zimbra_api/src/mail/type/size_test.dart';
import 'package:zimbra_api/src/mail/type/socialcast_test.dart';
import 'package:zimbra_api/src/mail/type/stop_action.dart';
import 'package:zimbra_api/src/mail/type/tag_action.dart';
import 'package:zimbra_api/src/mail/type/true_test.dart';
import 'package:zimbra_api/src/mail/type/twitter_test.dart';

void main() {
  final faker = Faker();

  group('Modify filter rules tests', (() {
    test('Modify filter rules request', (() {
      final name = faker.lorem.word();
      final value = faker.lorem.word();
      final active = faker.randomGenerator.boolean();
      final index = faker.randomGenerator.integer(100);
      final negative = faker.randomGenerator.boolean();
      final caseSensitive = faker.randomGenerator.boolean();
      final header = faker.lorem.word();
      final date = faker.date.dateTime().millisecondsSinceEpoch;
      final time = faker.date.dateTime().toString();
      final method = faker.lorem.word();
      final size = faker.lorem.word();

      final folder = faker.lorem.word();
      final copy = faker.randomGenerator.boolean();
      final tag = faker.lorem.word();
      final address = faker.internet.email();
      final content = faker.lorem.word();
      final subject = faker.lorem.word();
      final maxBodySize = faker.randomGenerator.integer(100);
      final origHeaders = faker.lorem.word();
      final from = faker.internet.email();
      final importance = faker.lorem.word();
      final options = faker.lorem.word();
      final message = faker.lorem.word();
      final last = faker.randomGenerator.boolean();
      final offset = faker.randomGenerator.integer(100);
      final countComparator = faker.randomGenerator.boolean();
      final valueComparator = faker.randomGenerator.boolean();

      final request = ModifyFilterRulesRequest([
        FilterRule(
          name,
          active,
          filterVariables: FilterVariables(
            index: index,
            variables: [
              FilterVariable(
                name: name,
                value: value,
              )
            ],
          ),
          filterTests: FilterTests(
            condition: FilterCondition.allof,
            addressBookTests: [AddressBookTest(header: header, index: index, negative: negative)],
            addressTests: [
              AddressTest(
                header: header,
                part: AddressPart.all,
                stringComparison: StringComparison.contains,
                caseSensitive: caseSensitive,
                value: value,
                valueComparison: ValueComparison.equal,
                countComparison: CountComparison.equal,
                valueComparisonComparator: ComparisonComparator.asciiNumeric,
                index: index,
                negative: negative,
              )
            ],
            envelopeTests: [
              EnvelopeTest(
                header: header,
                part: AddressPart.all,
                stringComparison: StringComparison.contains,
                caseSensitive: caseSensitive,
                value: value,
                valueComparison: ValueComparison.equal,
                countComparison: CountComparison.equal,
                valueComparisonComparator: ComparisonComparator.asciiNumeric,
                index: index,
                negative: negative,
              )
            ],
            attachmentTests: [AttachmentTest(index: index, negative: negative)],
            bodyTests: [BodyTest(value: value, caseSensitive: caseSensitive, index: index, negative: negative)],
            bulkTests: [BulkTest(index: index, negative: negative)],
            contactRankingTests: [ContactRankingTest(header: header, index: index, negative: negative)],
            conversationTests: [ConversationTest(where: WhereSetting.started, index: index, negative: negative)],
            currentDayOfWeekTests: [CurrentDayOfWeekTest(values: value, index: index, negative: negative)],
            currentTimeTests: [
              CurrentTimeTest(
                dateComparison: DateComparison.before,
                time: time,
                index: index,
                negative: negative,
              )
            ],
            dateTests: [DateTest(dateComparison: DateComparison.before, date: date, index: index, negative: negative)],
            facebookTests: [FacebookTest(index: index, negative: negative)],
            flaggedTests: [FlaggedTest(flag: FilterFlagName.flagged, index: index, negative: negative)],
            headerExistsTests: [HeaderExistsTest(header: header, index: index, negative: negative)],
            headerTests: [
              HeaderTest(
                headers: header,
                stringComparison: StringComparison.contains,
                valueComparison: ValueComparison.equal,
                countComparison: CountComparison.equal,
                valueComparisonComparator: ComparisonComparator.asciiNumeric,
                value: value,
                caseSensitive: caseSensitive,
                index: index,
                negative: negative,
              )
            ],
            importanceTests: [ImportanceTest(importance: Importance.normal, index: index, negative: negative)],
            inviteTests: [
              InviteTest(methods: [method], index: index, negative: negative)
            ],
            linkedinTests: [LinkedInTest(index: index, negative: negative)],
            listTests: [ListTest(index: index, negative: negative)],
            meTests: [MeTest(header: header, index: index, negative: negative)],
            mimeHeaderTests: [
              MimeHeaderTest(
                headers: header,
                stringComparison: StringComparison.contains,
                value: value,
                caseSensitive: caseSensitive,
                index: index,
                negative: negative,
              )
            ],
            sizeTests: [
              SizeTest(
                numberComparison: NumberComparison.over,
                size: size,
                index: index,
                negative: negative,
              )
            ],
            socialcastTests: [SocialcastTest(index: index, negative: negative)],
            trueTests: [TrueTest(index: index, negative: negative)],
            twitterTests: [TwitterTest(index: index, negative: negative)],
            communityRequestsTests: [CommunityRequestsTest(index: index, negative: negative)],
            communityContentTests: [CommunityContentTest(index: index, negative: negative)],
            communityConnectionsTests: [CommunityConnectionsTest(index: index, negative: negative)],
          ),
          filterActions: FilterActions(
            filterVariables: [
              FilterVariables(
                index: index,
                variables: [
                  FilterVariable(
                    name: name,
                    value: value,
                  )
                ],
              )
            ],
            keepActions: [KeepAction(index: index)],
            discardActions: [DiscardAction(index: index)],
            fileIntoActions: [FileIntoAction(folder: folder, copy: copy, index: index)],
            flagActions: [FlagAction(flag: FilterFlagName.flagged, index: index)],
            tagActions: [TagAction(tag: tag, index: index)],
            redirectActions: [RedirectAction(address: address, copy: copy, index: index)],
            replyActions: [ReplyAction(content: content, index: index)],
            notifyActions: [
              NotifyAction(
                address: address,
                subject: subject,
                maxBodySize: maxBodySize,
                content: content,
                origHeaders: origHeaders,
                index: index,
              )
            ],
            rfcCompliantNotifyActions: [
              RFCCompliantNotifyAction(
                from: from,
                importance: importance,
                options: options,
                message: message,
                method: method,
                index: index,
              )
            ],
            stopActions: [StopAction(index: index)],
            rejectActions: [RejectAction(content: content, index: index)],
            erejectActions: [ErejectAction(content: content, index: index)],
            logActions: [LogAction(level: LoggingLevel.info, content: content, index: index)],
            addheaderActions: [AddheaderAction(headerName: header, headerValue: value, last: last, index: index)],
            deleteheaderActions: [
              DeleteheaderAction(
                last: last,
                offset: offset,
                test: EditheaderTest(
                  matchType: MatchType.value,
                  countComparator: countComparator,
                  valueComparator: valueComparator,
                  relationalComparator: RelationalComparator.equal,
                  comparator: ComparisonComparator.asciiNumeric,
                  headerName: header,
                  headerValue: [value],
                ),
                index: index,
              )
            ],
            replaceheaderActions: [
              ReplaceheaderAction(
                newName: name,
                newValue: value,
                last: last,
                offset: offset,
                test: EditheaderTest(
                  matchType: MatchType.value,
                  countComparator: countComparator,
                  valueComparator: valueComparator,
                  relationalComparator: RelationalComparator.equal,
                  comparator: ComparisonComparator.asciiNumeric,
                  headerName: header,
                  headerValue: [value],
                ),
                index: index,
              )
            ],
          ),
          child: NestedRule(
            filterVariables: FilterVariables(
              index: index,
              variables: [
                FilterVariable(
                  name: name,
                  value: value,
                )
              ],
            ),
            filterTests: FilterTests(condition: FilterCondition.allof),
            filterActions: FilterActions(
              filterVariables: [
                FilterVariables(
                  index: index,
                  variables: [
                    FilterVariable(
                      name: name,
                      value: value,
                    )
                  ],
                )
              ],
            ),
            child: NestedRule(),
          ),
        )
      ]);

      expect(request.getEnvelope().toJson(), {
        'Body': {
          'ModifyFilterRulesRequest': {
            '_jsns': 'urn:zimbraMail',
            'filterRules': {
              'filterRule': [
                {
                  'name': name,
                  'active': active,
                  'filterVariables': {
                    'index': index,
                    'filterVariable': [
                      {
                        'name': name,
                        'value': value,
                      }
                    ],
                  },
                  'filterTests': {
                    'condition': FilterCondition.allof.name,
                    'addressBookTest': [
                      {
                        'header': header,
                        'index': index,
                        'negative': negative,
                      }
                    ],
                    'addressTest': [
                      {
                        'header': header,
                        'part': AddressPart.all.name,
                        'stringComparison': StringComparison.contains.name,
                        'caseSensitive': caseSensitive,
                        'value': value,
                        'valueComparison': ValueComparison.equal.name,
                        'countComparison': CountComparison.equal.name,
                        'valueComparisonComparator': ComparisonComparator.asciiNumeric.name,
                        'index': index,
                        'negative': negative,
                      }
                    ],
                    'envelopeTest': [
                      {
                        'header': header,
                        'part': AddressPart.all.name,
                        'stringComparison': StringComparison.contains.name,
                        'caseSensitive': caseSensitive,
                        'value': value,
                        'valueComparison': ValueComparison.equal.name,
                        'countComparison': CountComparison.equal.name,
                        'valueComparisonComparator': ComparisonComparator.asciiNumeric.name,
                        'index': index,
                        'negative': negative,
                      }
                    ],
                    'attachmentTest': [
                      {
                        'index': index,
                        'negative': negative,
                      }
                    ],
                    'bodyTest': [
                      {
                        'value': value,
                        'caseSensitive': caseSensitive,
                        'index': index,
                        'negative': negative,
                      }
                    ],
                    'bulkTest': [
                      {
                        'index': index,
                        'negative': negative,
                      }
                    ],
                    'contactRankingTest': [
                      {
                        'header': header,
                        'index': index,
                        'negative': negative,
                      }
                    ],
                    'conversationTest': [
                      {
                        'where': WhereSetting.started.name,
                        'index': index,
                        'negative': negative,
                      }
                    ],
                    'currentDayOfWeekTest': [
                      {
                        'value': value,
                        'index': index,
                        'negative': negative,
                      }
                    ],
                    'currentTimeTest': [
                      {
                        'dateComparison': DateComparison.before.name,
                        'time': time,
                        'index': index,
                        'negative': negative,
                      }
                    ],
                    'dateTest': [
                      {
                        'dateComparison': DateComparison.before.name,
                        'date': date,
                        'index': index,
                        'negative': negative,
                      }
                    ],
                    'facebookTest': [
                      {
                        'index': index,
                        'negative': negative,
                      }
                    ],
                    'flaggedTest': [
                      {
                        'flagName': FilterFlagName.flagged.name,
                        'index': index,
                        'negative': negative,
                      }
                    ],
                    'headerExistsTest': [
                      {
                        'header': header,
                        'index': index,
                        'negative': negative,
                      }
                    ],
                    'headerTest': [
                      {
                        'header': header,
                        'stringComparison': StringComparison.contains.name,
                        'valueComparison': ValueComparison.equal.name,
                        'countComparison': CountComparison.equal.name,
                        'valueComparisonComparator': ComparisonComparator.asciiNumeric.name,
                        'value': value,
                        'caseSensitive': caseSensitive,
                        'index': index,
                        'negative': negative,
                      }
                    ],
                    'importanceTest': [
                      {
                        'imp': Importance.normal.name,
                        'index': index,
                        'negative': negative,
                      }
                    ],
                    'inviteTest': [
                      {
                        'method': [
                          {'_content': method}
                        ],
                        'index': index,
                        'negative': negative,
                      },
                    ],
                    'linkedinTest': [
                      {
                        'index': index,
                        'negative': negative,
                      }
                    ],
                    'listTest': [
                      {
                        'index': index,
                        'negative': negative,
                      }
                    ],
                    'meTest': [
                      {
                        'header': header,
                        'index': index,
                        'negative': negative,
                      }
                    ],
                    'mimeHeaderTest': [
                      {
                        'header': header,
                        'stringComparison': StringComparison.contains.name,
                        'value': value,
                        'caseSensitive': caseSensitive,
                        'index': index,
                        'negative': negative,
                      }
                    ],
                    'sizeTest': [
                      {
                        'numberComparison': NumberComparison.over.name,
                        's': size,
                        'index': index,
                        'negative': negative,
                      }
                    ],
                    'socialcastTest': [
                      {
                        'index': index,
                        'negative': negative,
                      }
                    ],
                    'trueTest': [
                      {
                        'index': index,
                        'negative': negative,
                      }
                    ],
                    'twitterTest': [
                      {
                        'index': index,
                        'negative': negative,
                      }
                    ],
                    'communityRequestsTest': [
                      {
                        'index': index,
                        'negative': negative,
                      }
                    ],
                    'communityContentTest': [
                      {
                        'index': index,
                        'negative': negative,
                      }
                    ],
                    'communityConnectionsTest': [
                      {
                        'index': index,
                        'negative': negative,
                      }
                    ],
                  },
                  'filterActions': {
                    'filterVariables': [
                      {
                        'index': index,
                        'filterVariable': [
                          {
                            'name': name,
                            'value': value,
                          }
                        ],
                      }
                    ],
                    'actionKeep': [
                      {
                        'index': index,
                      }
                    ],
                    'actionDiscard': [
                      {
                        'index': index,
                      }
                    ],
                    'actionFileInto': [
                      {
                        'folderPath': folder,
                        'copy': copy,
                        'index': index,
                      }
                    ],
                    'actionFlag': [
                      {
                        'flagName': FilterFlagName.flagged.name,
                        'index': index,
                      }
                    ],
                    'actionTag': [
                      {
                        'tagName': tag,
                        'index': index,
                      }
                    ],
                    'actionRedirect': [
                      {
                        'a': address,
                        'copy': copy,
                        'index': index,
                      }
                    ],
                    'actionReply': [
                      {
                        'content': {'_content': content},
                        'index': index,
                      }
                    ],
                    'actionNotify': [
                      {
                        'a': address,
                        'su': subject,
                        'maxBodySize': maxBodySize,
                        'content': {'_content': content},
                        'origHeaders': origHeaders,
                        'index': index,
                      }
                    ],
                    'actionRFCCompliantNotify': [
                      {
                        'from': from,
                        'importance': importance,
                        'options': options,
                        'message': message,
                        'method': {'_content': method},
                        'index': index,
                      }
                    ],
                    'actionStop': [
                      {
                        'index': index,
                      }
                    ],
                    'actionReject': [
                      {
                        '_content': content,
                        'index': index,
                      }
                    ],
                    'actionEreject': [
                      {
                        '_content': content,
                        'index': index,
                      }
                    ],
                    'actionLog': [
                      {
                        'level': LoggingLevel.info.name,
                        '_content': content,
                        'index': index,
                      }
                    ],
                    'actionAddheader': [
                      {
                        'headerName': {'_content': header},
                        'headerValue': {'_content': value},
                        'last': last,
                        'index': index,
                      }
                    ],
                    'actionDeleteheader': [
                      {
                        'last': last,
                        'offset': offset,
                        'test': {
                          'matchType': MatchType.value.name,
                          'countComparator': countComparator,
                          'valueComparator': valueComparator,
                          'relationalComparator': RelationalComparator.equal.name,
                          'comparator': ComparisonComparator.asciiNumeric.name,
                          'headerName': {'_content': header},
                          'headerValue': [
                            {'_content': value}
                          ],
                        },
                        'index': index,
                      }
                    ],
                    'actionReplaceheader': [
                      {
                        'newName': {'_content': name},
                        'newValue': {'_content': value},
                        'last': last,
                        'offset': offset,
                        'test': {
                          'matchType': MatchType.value.name,
                          'countComparator': countComparator,
                          'valueComparator': valueComparator,
                          'relationalComparator': RelationalComparator.equal.name,
                          'comparator': ComparisonComparator.asciiNumeric.name,
                          'headerName': {'_content': header},
                          'headerValue': [
                            {'_content': value}
                          ],
                        },
                        'index': index,
                      }
                    ],
                  },
                  'nestedRule': {
                    'filterVariables': {
                      'index': index,
                      'filterVariable': [
                        {
                          'name': name,
                          'value': value,
                        }
                      ],
                    },
                    'filterTests': {
                      'condition': FilterCondition.allof.name,
                    },
                    'filterActions': {
                      'filterVariables': [
                        {
                          'index': index,
                          'filterVariable': [
                            {
                              'name': name,
                              'value': value,
                            }
                          ],
                        }
                      ]
                    },
                    'nestedRule': {},
                  },
                }
              ]
            },
          }
        },
      });
    }));

    test('Modify filter rules resonse', (() {
      final json = {
        'Body': {
          'ModifyFilterRulesResponse': {
            '_jsns': 'urn:zimbraMail',
          }
        }
      };
      final envelope = ModifyFilterRulesEnvelope.fromJson(json);
      final response = envelope.modifyFilterRulesBody.modifyFilterRulesResponse;
      expect(response, isNotNull);
      expect(response, isA<ModifyFilterRulesResponse>());
    }));
  }));
}
