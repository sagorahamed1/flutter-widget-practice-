import 'package:hive/hive.dart';
part 'persor.g.dart';


@HiveType(typeId: 0)
class Person extends HiveObject{
  @HiveField(0)
 late String name;
  @HiveField(1)
 late String address;
}