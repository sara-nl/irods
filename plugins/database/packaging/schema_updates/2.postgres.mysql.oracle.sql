insert into R_SPECIFIC_QUERY (alias, sqlStr, create_ts) values ('listQueryByAliasLike', 'SELECT alias, sqlStr FROM R_SPECIFIC_QUERY WHERE alias LIKE ?', '1388534400');
insert into R_SPECIFIC_QUERY (alias, sqlStr, create_ts) values ('findQueryByAlias', 'SELECT alias, sqlStr FROM R_SPECIFIC_QUERY WHERE alias = ?', '1388534400');
insert into R_SPECIFIC_QUERY (alias, sqlStr, create_ts) values ('ilsLACollections', 'SELECT c.parent_coll_name, c.coll_name, c.create_ts, c.modify_ts, c.coll_id, c.coll_owner_name, c.coll_owner_zone, c.coll_type, u.user_name, u.zone_name, a.access_type_id, u.user_id FROM R_COLL_MAIN c JOIN R_OBJT_ACCESS a ON c.coll_id = a.object_id JOIN R_USER_MAIN u ON a.user_id = u.user_id WHERE c.parent_coll_name = ? ORDER BY c.coll_name, u.user_name, a.access_type_id DESC LIMIT ? OFFSET ?', '1388534400');
insert into R_SPECIFIC_QUERY (alias, sqlStr, create_ts) values ('ilsLADataObjects', 'SELECT s.coll_name, s.data_name, s.create_ts, s.modify_ts, s.data_id, s.data_size, s.data_repl_num, s.data_owner_name, s.data_owner_zone, u.user_name, u.user_id, a.access_type_id, u.user_type_name, u.zone_name FROM ( SELECT c.coll_name, d.data_name, d.create_ts, d.modify_ts, d.data_id, d.data_repl_num, d.data_size, d.data_owner_name, d.data_owner_zone FROM R_COLL_MAIN c JOIN R_DATA_MAIN d ON c.coll_id = d.coll_id WHERE c.coll_name = ? ORDER BY d.data_name) s JOIN R_OBJT_ACCESS a ON s.data_id = a.object_id JOIN R_USER_MAIN u ON a.user_id = u.user_id ORDER BY s.coll_name, s.data_name, u.user_name, a.access_type_id DESC LIMIT ? OFFSET ?', '1388534400');
insert into R_SPECIFIC_QUERY (alias, sqlStr, create_ts) values ('listSharedCollectionsOwnedByUser', 'SELECT DISTINCT R_COLL_MAIN.coll_id, R_COLL_MAIN.parent_coll_name, R_COLL_MAIN.coll_name, R_COLL_MAIN.coll_owner_name, R_COLL_MAIN.coll_owner_zone, R_META_MAIN.meta_attr_name, R_META_MAIN.meta_attr_value, R_META_MAIN.meta_attr_unit FROM R_COLL_MAIN JOIN R_OBJT_METAMAP ON R_COLL_MAIN.coll_id = R_OBJT_METAMAP.object_id JOIN R_META_MAIN ON R_OBJT_METAMAP.meta_id = R_META_MAIN.meta_id WHERE R_META_MAIN.meta_attr_unit = ''iRODSUserTagging:Share'' AND R_COLL_MAIN.coll_owner_name = ? AND R_COLL_MAIN.coll_owner_zone = ? ORDER BY R_COLL_MAIN.parent_coll_name ASC, R_COLL_MAIN.coll_name ASC', '1388534400');
insert into R_SPECIFIC_QUERY (alias, sqlStr, create_ts) values ('listSharedCollectionsSharedWithUser', 'SELECT DISTINCT R_COLL_MAIN.coll_id, R_COLL_MAIN.parent_coll_name, R_COLL_MAIN.coll_name, R_COLL_MAIN.coll_owner_name, R_COLL_MAIN.coll_owner_zone, R_META_MAIN.meta_attr_name, R_META_MAIN.meta_attr_value, R_META_MAIN.meta_attr_unit, R_USER_MAIN.user_name, R_USER_MAIN.zone_name, R_OBJT_ACCESS.access_type_id FROM R_COLL_MAIN JOIN R_OBJT_METAMAP ON R_COLL_MAIN.coll_id = R_OBJT_METAMAP.object_id JOIN R_META_MAIN ON R_OBJT_METAMAP.meta_id = R_META_MAIN.meta_id JOIN R_OBJT_ACCESS ON R_COLL_MAIN.coll_id = R_OBJT_ACCESS.object_id JOIN R_USER_MAIN ON R_OBJT_ACCESS.user_id = R_USER_MAIN.user_id WHERE R_META_MAIN.meta_attr_unit = ''iRODSUserTagging:Share'' AND R_USER_MAIN.user_name = ? AND R_USER_MAIN.zone_name = ? AND R_COLL_MAIN.coll_owner_name <> ? ORDER BY R_COLL_MAIN.parent_coll_name ASC, R_COLL_MAIN.coll_name ASC', '1388534400');
insert into R_SPECIFIC_QUERY (alias, sqlStr, create_ts) values ('listUserACLForDataObjViaGroup', 'SELECT R_USER_MAIN.user_name, R_USER_MAIN.user_id, R_OBJT_ACCESS.access_type_id, R_USER_MAIN.user_type_name, R_USER_MAIN.zone_name, R_COLL_MAIN.coll_name, R_DATA_MAIN.data_name, USER_GROUP_MAIN.user_name, R_DATA_MAIN.data_name, R_COLL_MAIN.coll_name FROM R_USER_MAIN AS USER_GROUP_MAIN JOIN R_USER_GROUP JOIN R_USER_MAIN ON R_USER_GROUP.user_id = R_USER_MAIN.user_id ON USER_GROUP_MAIN.user_id = R_USER_GROUP.group_user_id JOIN R_OBJT_ACCESS ON R_USER_GROUP.group_user_id = R_OBJT_ACCESS.user_id JOIN R_DATA_MAIN JOIN R_COLL_MAIN ON R_DATA_MAIN.coll_id = R_COLL_MAIN.coll_id ON R_OBJT_ACCESS.object_id = R_DATA_MAIN.data_id WHERE  R_COLL_MAIN.coll_name = ? AND R_DATA_MAIN.data_name = ? AND R_USER_MAIN.user_name = ? ORDER BY R_COLL_MAIN.coll_name, R_DATA_MAIN.data_name, R_USER_MAIN.user_name, R_OBJT_ACCESS.access_type_id DESC', '1388534400');
insert into R_SPECIFIC_QUERY (alias, sqlStr, create_ts) values ('listUserACLForCollectionViaGroup', 'SELECT R_USER_MAIN.user_name, R_USER_MAIN.user_id, R_OBJT_ACCESS.access_type_id, R_USER_MAIN.user_type_name, R_USER_MAIN.zone_name, R_COLL_MAIN.coll_name, USER_GROUP_MAIN.user_name, R_COLL_MAIN.coll_name FROM R_USER_MAIN AS USER_GROUP_MAIN JOIN R_USER_GROUP JOIN R_USER_MAIN ON R_USER_GROUP.user_id = R_USER_MAIN.user_id ON USER_GROUP_MAIN.user_id = R_USER_GROUP.group_user_id JOIN R_OBJT_ACCESS ON R_USER_GROUP.group_user_id = R_OBJT_ACCESS.user_id JOIN R_COLL_MAIN ON R_OBJT_ACCESS.object_id = R_COLL_MAIN.coll_id WHERE R_COLL_MAIN.coll_name = ? AND R_USER_MAIN.user_name = ? ORDER BY R_COLL_MAIN.coll_name, R_USER_MAIN.user_name, R_OBJT_ACCESS.access_type_id DESC', '1388534400');