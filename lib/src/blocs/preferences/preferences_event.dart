

import 'package:equatable/equatable.dart';

abstract class PreferencesEvent extends Equatable{

  @override  
  List<Object> get props => [];
}

class LoadPreferences extends PreferencesEvent{}

class UpdatePreferences extends PreferencesEvent{
  final bool isLoggedIn;

  UpdatePreferences(this.isLoggedIn) : super();

  @override  
  List<Object> get props => [isLoggedIn];
}
