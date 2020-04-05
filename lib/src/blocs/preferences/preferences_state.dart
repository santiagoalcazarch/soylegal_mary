import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class PreferencesState extends Equatable{

  @override
  List<Object> get props => [];
}

class PreferencesNotLoaded extends PreferencesState{}

class PreferencesLoaded extends PreferencesState{

  final bool isLoggidIn;

  PreferencesLoaded({
    @required this.isLoggidIn
  }) : super();

  @override
  List<Object> get props => [isLoggidIn];

}

