import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable{
       // const Failure([List properties = const<dynamic>[]]) : super();
       final List<Object> properties;
       const Failure({required this.properties});
       @override
  List<Object> get props => properties;
}