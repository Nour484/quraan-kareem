import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';

import 'quraan.dart';

part 'serializers.g.dart';

@SerializersFor([Surahs, Ayahs])
final Serializers serializers =
    (_$serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();
